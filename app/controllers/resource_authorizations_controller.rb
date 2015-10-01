class ResourceAuthorizationsController < ApplicationController
  # GET /resource_authorizations
  # GET /resource_authorizations.json
  def index
    @resource_authorizations = ResourceAuthorization.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resource_authorizations }
    end
  end

  # GET /resource_authorizations/1
  # GET /resource_authorizations/1.json
  def show
    @resource_authorization = ResourceAuthorization.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resource_authorization }
    end
  end

  # GET /resource_authorizations/new
  # GET /resource_authorizations/new.json
  def new
    @resource_authorization = ResourceAuthorization.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resource_authorization }
    end
  end

  # GET /resource_authorizations/1/edit
  def edit
    @resource_authorization = ResourceAuthorization.find(params[:id])
  end

  # POST /resource_authorizations
  # POST /resource_authorizations.json
  def create
    @resource_authorization = ResourceAuthorization.new(params[:resource_authorization])

    respond_to do |format|
      if @resource_authorization.save
        format.html { redirect_to @resource_authorization, notice: 'Resource authorization was successfully created.' }
        format.json { render json: @resource_authorization, status: :created, location: @resource_authorization }
      else
        format.html { render action: "new" }
        format.json { render json: @resource_authorization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resource_authorizations/1
  # PUT /resource_authorizations/1.json
  def update
    @resource_authorization = ResourceAuthorization.find(params[:id])

    respond_to do |format|
      if @resource_authorization.update_attributes(params[:resource_authorization])
        format.html { redirect_to @resource_authorization, notice: 'Resource authorization was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resource_authorization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resource_authorizations/1
  # DELETE /resource_authorizations/1.json
  def destroy
    @resource_authorization = ResourceAuthorization.find(params[:id])
    @resource_authorization.destroy

    respond_to do |format|
      format.html { redirect_to resource_authorizations_url }
      format.json { head :no_content }
    end
  end
end
