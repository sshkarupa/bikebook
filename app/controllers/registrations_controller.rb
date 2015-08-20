class RegistrationsController < Devise::RegistrationsController

  def new
    build_resource({})
    self.resource.phone = Phone.new
    respond_with self.resource
  end

end