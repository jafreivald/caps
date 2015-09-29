class ResourceUtilizationsController < ApplicationController
  # GET /resource_utilizations
  # GET /resource_utilizations.json
  def index
    @resource_utilizations = ResourceUtilization.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resource_utilizations }
    end
  end

  # GET /resource_utilizations/1
  # GET /resource_utilizations/1.json
  def show
    @resource_utilization = ResourceUtilization.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @resource_utilization }
    end
  end

  # GET /resource_utilizations/new
  # GET /resource_utilizations/new.json
  def new
    @resource_utilization = ResourceUtilization.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resource_utilization }
    end
  end

  # GET /resource_utilizations/1/edit
  def edit
    @resource_utilization = ResourceUtilization.find(params[:id])
  end

  # POST /resource_utilizations
  # POST /resource_utilizations.json
  def create
    @resource_utilization = ResourceUtilization.new(params[:resource_utilization])

    respond_to do |format|
      if @resource_utilization.save
        format.html { redirect_to @resource_utilization, notice: 'Resource utilization was successfully created.' }
        format.json { render json: @resource_utilization, status: :created, location: @resource_utilization }
      else
        format.html { render action: "new" }
        format.json { render json: @resource_utilization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resource_utilizations/1
  # PUT /resource_utilizations/1.json
  def update
    @resource_utilization = ResourceUtilization.find(params[:id])

    respond_to do |format|
      if @resource_utilization.update_attributes(params[:resource_utilization])
        format.html { redirect_to @resource_utilization, notice: 'Resource utilization was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resource_utilization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resource_utilizations/1
  # DELETE /resource_utilizations/1.json
  def destroy
    @resource_utilization = ResourceUtilization.find(params[:id])
    @resource_utilization.destroy

    respond_to do |format|
      format.html { redirect_to resource_utilizations_url }
      format.json { head :no_content }
    end
  end
end
