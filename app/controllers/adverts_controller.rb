class AdvertsController < ApplicationController
  def index
    @adverts = current_user.adverts
  end

  def new
    @advert = Advert.new
  end

  def create
    @advert = current_user.adverts.build(advert_params)
    if @advert.save
      redirect_to adverts_path
      flash[:notice] = "success create"
    else
      render :new
    end
  end

  def edit
    @advert = current_user.adverts.find(params[:id])

  end

  def destroy
    @advert = current_user.adverts.find(params[:id])
    if @advert.destroy
      redirect_to adverts_path
    else
      render :destroy
    end
  end

  def advert_params
    params.require(:advert).permit(:title, :description, :bike_type,  :gears, :wheels, :suspension, :sex, :price)
  end
end

