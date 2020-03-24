# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone_number])
    devise_parameter_sanitizer.permit(:account_update, keys: [:phone_number])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:gender])
    devise_parameter_sanitizer.permit(:account_update, keys: [:gender])
  end

  after_action :store_location

  def store_location
    if request.fullpath != '/users/sign_in' &&
       request.fullpath != '/users/sign_up' &&
       request.fullpath !~ Regexp.new('\\A/users/password.*\\z') &&
       !request.xhr? # don't store ajax calls
      session[:previous_url] = request.fullpath
    end
  end
end
