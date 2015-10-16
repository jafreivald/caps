class SeverityLevelsController < ApplicationController
  before_filter :authorize
  
  # GET /severity_levels
  # GET /severity_levels.json
  def index
    @severity_levels = SeverityLevel.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @severity_levels }
    end
  end

  # GET /severity_levels/1
  # GET /severity_levels/1.json
  def show
    @severity_level = SeverityLevel.find(params[:id])

    respond_to do |format|
      format.html { redirect_to :action => :edit }
      format.json { render json: @severity_level }
    end
  end

  # GET /severity_levels/new
  # GET /severity_levels/new.json
  def new
    @severity_level = SeverityLevel.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @severity_level }
    end
  end

  # GET /severity_levels/1/edit
  def edit
    @severity_level = SeverityLevel.find(params[:id])
  end

  # POST /severity_levels
  # POST /severity_levels.json
  def create
    @severity_level = SeverityLevel.new(params[:severity_level])

    respond_to do |format|
      if @severity_level.save
        format.html { redirect_to @severity_level, notice: 'Severity level was successfully created.' }
        format.json { render json: @severity_level, status: :created, location: @severity_level }
      else
        format.html { render action: "new" }
        format.json { render json: @severity_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /severity_levels/1
  # PUT /severity_levels/1.json
  def update
    @severity_level = SeverityLevel.find(params[:id])

    respond_to do |format|
      if @severity_level.update_attributes(params[:severity_level])
        format.html { redirect_to @severity_level, notice: 'Severity level was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @severity_level.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /severity_levels/1
  # DELETE /severity_levels/1.json
  def destroy
    @severity_level = SeverityLevel.find(params[:id])
    @severity_level.destroy

    respond_to do |format|
      format.html { redirect_to severity_levels_url }
      format.json { head :no_content }
    end
  end
end
