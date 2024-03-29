class ApplicationController < ActionController::Base
  protect_from_forgery
  if ENV['RAILS_ENV'] == "production"
    force_ssl
  end
  
  private
  def current_profile
    if session[:user_id].nil?
      return nil
    end
    @current_profile ||= Profile.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_profile
  
  def authorize
    if current_profile.nil?
      flash[:"alert-danger"] = "Not Authorized"
      redirect_to login_url
      return false
    end
    return true
  end
  helper_method :authorize
end
