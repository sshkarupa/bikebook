class CitiesController < ApplicationController
  def show
    @cities = City.where(department_id: params[:id])
    render json: { cities: @cities }
  end
end
