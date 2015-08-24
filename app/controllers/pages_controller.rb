class PagesController < ApplicationController
  def home
    @bikes = Bike.all.order(created_at: :desc)
  end
end
