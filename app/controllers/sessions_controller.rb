class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    profile = Profile.find_by_userid(params[:userid])
    if profile && profile.authenticate(params[:password])
      session[:user_id] = profile.id
      flash[:"alert-success"] = "Log in successful"
      redirect_to root_url
    else
      flash[:"alert-danger"] = "User ID or password is incorrect"
      render :action => :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    reset_session
    flash[:"alert-success"] = "Logged out"
    redirect_to root_url
  end
  
  def password_reset
    
  end 
  
  def send_confirmation_email
    profile = Profile.find_by_email(params[:email])
    if (profile != nil && profile.valid?)
      profile.send_password_reset
      flash[:"alert-success"] = "Email sent with password reset instructions."
    else
      flash[:"alert-danger"] = "#{params[:email]} is not a valid address."
    end
    redirect_to root_url
  end
  
  def new_password
    @profile = Profile.find_by_password_reset_token(params[:password_reset_token])
    if @profile.nil? || @profile.has_expired_password_reset_token
      flash[:"alert-danger"] = "Password reset token has expired"
      redirect_to root_url
    end
  end
  
end
