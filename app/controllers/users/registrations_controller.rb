class Users::RegistrationsController <  Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:profile_image, :type, :name, :number, :address])
    devise_parameter_sanitizer.permit(:account_update, keys: [:profile_image, :name, :phone_number, :address])
  end
  

end
