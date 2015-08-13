class BikesController < ApplicationController
  def show
    @bike = Bike.find(params[:id])
    @user = User.all
  end
end
