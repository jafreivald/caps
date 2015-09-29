class ApplicationController < ActionController::Base
  protect_from_forgery
  force_ssl
  
  private
  def current_profile
    @current_profile ||= Profile.find_by_userid(session[:userid]) if session[:userid]
  end
  helper_method :current_profile
  
  def authorize
    redirect_to login_url, alert: "Not Authorized" if current_user.nil?
  end
end
