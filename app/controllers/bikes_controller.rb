class BikesController < ApplicationController

  before_action :authenticate_user!

  def index
    @bikes = current_user.bikes
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = current_user.bikes.build(bike_params)
    if @bike.save
      redirect_to bikes_path
      flash[:notice] = "success create"
    else
      render :new
    end
  end

  def edit
    @bike = current_user.bikes.find(params[:id])

  end

  def destroy
    @bike = current_user.bikes.find(params[:id])
    if @bike.destroy
      redirect_to bikes_path
    else
      render :destroy
    end
  end

  def bike_params
    params.require(:bike).permit(:title, :description, :bike_type,  :gears, :wheels, :suspension, :sex, :price, :picture)
  end
end
