class UpdateActionsController < ApplicationController
  # GET /update_actions
  # GET /update_actions.json
  def index
    @update_actions = UpdateAction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @update_actions }
    end
  end

  # GET /update_actions/1
  # GET /update_actions/1.json
  def show
    @update_action = UpdateAction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @update_action }
    end
  end

  # GET /update_actions/new
  # GET /update_actions/new.json
  def new
    @update_action = UpdateAction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @update_action }
    end
  end

  # GET /update_actions/1/edit
  def edit
    @update_action = UpdateAction.find(params[:id])
  end

  # POST /update_actions
  # POST /update_actions.json
  def create
    @update_action = UpdateAction.new(params[:update_action])

    respond_to do |format|
      if @update_action.save
        format.html { redirect_to @update_action, notice: 'Update action was successfully created.' }
        format.json { render json: @update_action, status: :created, location: @update_action }
      else
        format.html { render action: "new" }
        format.json { render json: @update_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /update_actions/1
  # PUT /update_actions/1.json
  def update
    @update_action = UpdateAction.find(params[:id])

    respond_to do |format|
      if @update_action.update_attributes(params[:update_action])
        format.html { redirect_to @update_action, notice: 'Update action was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @update_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /update_actions/1
  # DELETE /update_actions/1.json
  def destroy
    @update_action = UpdateAction.find(params[:id])
    @update_action.destroy

    respond_to do |format|
      format.html { redirect_to update_actions_url }
      format.json { head :no_content }
    end
  end
end
