class ApplicationController < ActionController::Base
	 # include CanCan::ControllerAdditions
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  protected
  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up){|u| u.permit(:username, :email, :password, :password_confirmation, :role)}
  end

end
