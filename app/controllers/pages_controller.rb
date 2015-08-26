class PagesController < ApplicationController
  def home
    @bikes = Bike.all.approved.order(created_at: :desc)
  end
end
