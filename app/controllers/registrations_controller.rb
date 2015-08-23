class RegistrationsController < Devise::RegistrationsController

  def new
    build_resource({})
    self.resource.phone = Phone.new
    respond_with self.resource
  end

  def after_update_path_for(resource)
    edit_user_registration_path
  end
end