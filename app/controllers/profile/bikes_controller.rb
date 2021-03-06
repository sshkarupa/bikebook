class Profile::BikesController < ApplicationController
  before_action :authenticate_user!

  def index
    @bikes = current_user.bikes.order(created_at: :desc)
  end

  def new
    @bike = Bike.new
    @departments = Department.all.map { |dep| [dep.name, dep.id]}
    @cities = City.where(department_id: 1)
    bike_config
    @bike.pictures.build
  end

  def show
    @bike = Bike.find(params[:id])
    @user = User.all
  end

  def create
    @bike = current_user.bikes.build(bike_params)
    bike_config
    bike_location @bike
    unless @bike.pictures.present?
      @bike.pictures.build
    end
    if @bike.save
      redirect_to profile_bikes_path
      flash[:notice] = "Объявление создано"
    else
      render :new
    end
  end

  def edit
    @bike = current_user.bikes.find(params[:id])
    bike_config
    bike_location @bike
  end

  def update
    @bike = current_user.bikes.find(params[:id])
    bike_config
    bike_location @bike
    if @bike.update_attributes(bike_params)
      redirect_to profile_bikes_path
      flash[:notice] = "Объявление сохранено"
    else
      render :edit
    end
  end


  def destroy
    @bike = current_user.bikes.find(params[:id])
    if @bike.destroy
      redirect_to profile_bikes_path
      flash[:notice] = "Объявление удалено"
    else
      render :destroy
    end
  end

  def moderation
    @bikes = Bike.all.on_moderation
    authorize! :all, @bikes
  end

  def moderation_update
    @bike = Bike.find(params[:id])
    authorize! :all, @bike

    if @bike.update(bike_moderation_params)
      render json: { message: {success: 'Статус успешно изменен'}}
    else
      render json: { message: {alert: 'Произошла ошибка'}}, status: 400
    end
  end

  def bike_moderation_params
    params.permit(:status, :status_message)
  end

  def bike_params
    params.require(:bike).permit(:title, :description, :bike_type, :city, :department, :gears, :wheels, :suspension, :sex, :age, :price, pictures_attributes: [:id, :img, :_destroy])
  end

  def bike_location bike
    @departments = Department.all.map { |el| [el.name, el.id]}
    @department_selected = Department.find(bike.department).id.presence || 1
    @cities = City.where(department_id: @department_selected)
    @city_selected = City.find(@department_selected).id.presence || 1
  end

  def bike_config
    @bike_types = BikeType.all.map { |el| [el.name, el.id]}
    @suspension = Suspension.all.map { |el| [el.name, el.id]}
    @sex = Sex.all.map { |el| [el.name, el.id]}
    @age = Age.all.map { |el| [el.name, el.id]}
  end

end