class SessionsController < ApplicationController
  def new
    
  end
  
  def create
    user = Profile.find_by_userid(params[:userid])
    if user && user.authenticate(params[:password])
      session[:userid] = user.id
      redirect_to root_url, notice: "Log in successful"
    else
      flash.now.alert = "User ID or password is incorrect"
      render :action => :new
    end
  end
  
  def destroy
    session[:userid] = nil
    reset_session
    redirect_to root_url, notice: "Logged out"
  end
end
