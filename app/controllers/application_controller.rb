class ApplicationController < ActionController::Base
	 # include CanCan::ControllerAdditions
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :password, :remember_me, :role) }
  	devise_parameter_sanitizer.for(:sign_up){|u| u.permit(:username, :email, :password, :password_confirmation, :role)}
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :role, :email, :password, :password_confirmation, :current_password)}
  end

end
