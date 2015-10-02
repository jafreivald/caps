class ActivityUpdatesController < ApplicationController
  # GET /activity_updates
  # GET /activity_updates.json
  def index
    @activity_updates = ActivityUpdate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activity_updates }
    end
  end

  # GET /activity_updates/1
  # GET /activity_updates/1.json
  def show
    @activity_update = ActivityUpdate.find(params[:id])

    respond_to do |format|
      format.html { redirect_to :action => :edit }
      format.json { render json: @activity_update }
    end
  end

  # GET /activity_updates/new
  # GET /activity_updates/new.json
  def new
    @activity_update = ActivityUpdate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity_update }
    end
  end

  # GET /activity_updates/1/edit
  def edit
    @activity_update = ActivityUpdate.find(params[:id])
  end

  # POST /activity_updates
  # POST /activity_updates.json
  def create
    @activity_update = ActivityUpdate.new(params[:activity_update])

    respond_to do |format|
      if @activity_update.save
        format.html { redirect_to @activity_update, notice: 'Activity update was successfully created.' }
        format.json { render json: @activity_update, status: :created, location: @activity_update }
      else
        format.html { render action: "new" }
        format.json { render json: @activity_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activity_updates/1
  # PUT /activity_updates/1.json
  def update
    @activity_update = ActivityUpdate.find(params[:id])

    respond_to do |format|
      if @activity_update.update_attributes(params[:activity_update])
        format.html { redirect_to @activity_update, notice: 'Activity update was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity_update.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_updates/1
  # DELETE /activity_updates/1.json
  def destroy
    @activity_update = ActivityUpdate.find(params[:id])
    @activity_update.destroy

    respond_to do |format|
      format.html { redirect_to activity_updates_url }
      format.json { head :no_content }
    end
  end
end
