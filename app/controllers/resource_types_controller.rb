class ResourceTypesController < ApplicationController
  before_filter :authorize
  
  # GET /resource_types
  # GET /resource_types.json
  def index
    @resource_types = ResourceType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resource_types }
    end
  end

  # GET /resource_types/1
  # GET /resource_types/1.json
  def show
    @resource_type = ResourceType.find(params[:id])

    respond_to do |format|
      format.html { redirect_to :action => :edit }
      format.json { render json: @resource_type }
    end
  end

  # GET /resource_types/new
  # GET /resource_types/new.json
  def new
    @resource_type = ResourceType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resource_type }
    end
  end

  # GET /resource_types/1/edit
  def edit
    @resource_type = ResourceType.find(params[:id])
  end

  # POST /resource_types
  # POST /resource_types.json
  def create
    @resource_type = ResourceType.new(params[:resource_type])

    respond_to do |format|
      if @resource_type.save
        format.html { redirect_to @resource_type, notice: 'Resource type was successfully created.' }
        format.json { render json: @resource_type, status: :created, location: @resource_type }
      else
        format.html { render action: "new" }
        format.json { render json: @resource_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resource_types/1
  # PUT /resource_types/1.json
  def update
    @resource_type = ResourceType.find(params[:id])

    respond_to do |format|
      if @resource_type.update_attributes(params[:resource_type])
        format.html { redirect_to @resource_type, notice: 'Resource type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resource_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resource_types/1
  # DELETE /resource_types/1.json
  def destroy
    begin
    @resource_type = ResourceType.find(params[:id])
    @resource_type.destroy
    rescue ActiveRecord::DeleteRestrictionError
      flash[:"alert-danger"] = "Could not delete the resource type because there are resources assigned to this type."
      redirect_to resources_path
      return
    end
    respond_to do |format|
      format.html { redirect_to resource_types_url }
      format.json { head :no_content }
    end
  end
end
