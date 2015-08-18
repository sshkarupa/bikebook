class BikesController < ApplicationController

  def show
    @bike = Bike.find(params[:id])
    @user = User.find(@bike.user_id)
    @department = Department.find(@bike.department)
    @city = @department.cities.find_by(id: @bike.city)
  end

end
