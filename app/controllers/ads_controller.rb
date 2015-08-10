class AdsController < ApplicationController

  def index
    @ads = current_user.ads
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = current_user.ads.build(ad_params)
    if @ad.save
      render :create
    else
      render :new
    end
  end

  def ad_params
    params.require(:ad).permit(:sex)
  end
end
