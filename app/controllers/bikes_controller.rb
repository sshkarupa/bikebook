class BikesController < ApplicationController

  def show
    if user_signed_in?
      if current_user.role == 'user'
        @bike = current_user.bikes.find(params[:id])
      elsif current_user.role == 'admin'
        @bike = Bike.find(params[:id])
      end
    else
      @bike = Bike.approved.find(params[:id])
    end

    @user = User.find(@bike.user_id)
    @department = Department.find(@bike.department)
    @city = @department.cities.find_by(id: @bike.city)

    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

end
