class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    profile = Profile.find_by_userid(params[:userid])
    if profile && profile.authenticate(params[:password])
      session[:user_id] = profile.id
      redirect_to root_url, notice: "Log in successful"
    else
      flash.now.alert = "User ID or password is incorrect"
      render :action => :new
    end
  end
  
  def destroy
    session[:user_id] = nil
    reset_session
    redirect_to root_url, notice: "Logged out"
  end
end
