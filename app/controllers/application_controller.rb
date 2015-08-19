class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user.bikes.any?
      profile_bikes_path
    else
      new_profile_bike_path
    end
  end
  
  protected
  def configure_permitted_parameters

    devise_parameter_sanitizer.for(:sign_up) << [:phone, :name]
    devise_parameter_sanitizer.for(:account_update) << [:phone, :name]
  end

end
