class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if current_user.role == 'admin'
      profile_bikes_moderation_path
    elsif current_user.bikes.any?
      profile_bikes_path
    else
      new_profile_bike_path
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/', :alert => exception.message
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [[phone_attributes: [:id, :number, :_destroy]], :name]
    devise_parameter_sanitizer.for(:account_update) << [[phone_attributes: [:id, :number, :_destroy]], :name]
  end


end

