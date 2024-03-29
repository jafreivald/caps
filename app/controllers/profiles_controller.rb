class ProfilesController < ApplicationController
  before_filter :authorize
  skip_before_filter :authorize, :only => [ :new, :create, :update ]
  
  # GET /profiles
  # GET /profiles.json
  def index
    @profiles = Profile.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @profiles }
    end
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @profile = Profile.find(params[:id])

    respond_to do |format|
      format.html { redirect_to :action => :edit }
      format.json { render json: @profile }
    end
  end

  # GET /profiles/new
  # GET /profiles/new.json
  def new
    @profile = Profile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profile }
    end
  end

  # GET /profiles/1/edit
  def edit
    @profile = Profile.find(params[:id])
  end

  # POST /profiles
  # POST /profiles.json
  def create
    @profile = Profile.new(params[:profile])

    respond_to do |format|
      if @profile.save
        session[:user_id]=@profile.id
        format.html { flash[:"alert-success"] = 'Profile was successfully created.'; redirect_to root_url}
        format.json { render json: @profile, status: :created, location: @profile }
      else
        format.html { render action: "new" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /profiles/1
  # PUT /profiles/1.json
  def update
    if params[:profile][:password_reset_token].nil? || (@profile = Profile.find_by_password_reset_token(params[:profile][:password_reset_token])).nil?
      if authorize == false
        return
      end
    else
      if @profile != nil && @profile.has_expired_password_reset_token
        flash[:"alert-danger"] = "Password reset token has expired"
        redirect_to root_url
        return
      else
        session[:user_id] = @profile.id
      end
    end
    
    if @profile.nil?
      @profile = Profile.find(params[:id])
    end

    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { flash[:"alert-success"] = 'Profile was successfully updated.'; redirect_to edit_profile_path(@profile) }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    @profile = Profile.find(params[:id])
    logout_after = false
    if @profile == current_profile
      logout_after = true
    end
    name = @profile.full_name
    @profile.destroy
    if logout_after
      session[:user_id] = nil;
    end

    respond_to do |format|
      format.html { flash[:"alert-success"] = "#{name}'s profile was successfully deleted."; redirect_to current_profile.nil? ? login_path : profiles_url }
      format.json { head :no_content }
    end
  end
end
