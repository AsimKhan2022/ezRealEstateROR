class ApplicationController < ActionController::Base
  before_action :authenticate_admin!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    if resource.admin?
      dashboard_path
    else
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[username avatar telephone mobile_phone])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[username avatar telephone mobile_phone])
  end
end
