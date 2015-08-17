class BikesController < ApplicationController

  def show
    @bike = Bike.find(params[:id])
    @user = User.find(@bike.user_id)
    @city = City.find(@bike.city)
  end

end
