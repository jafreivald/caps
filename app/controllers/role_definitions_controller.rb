class RoleDefinitionsController < ApplicationController
  before_filter :authorize
  
  # GET /role_definitions
  # GET /role_definitions.json
  def index
    @role_definitions = RoleDefinition.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @role_definitions }
    end
  end

  # GET /role_definitions/1
  # GET /role_definitions/1.json
  def show
    @role_definition = RoleDefinition.find(params[:id])

    respond_to do |format|
      format.html { redirect_to :action => :edit }
      format.json { render json: @role_definition }
    end
  end

  # GET /role_definitions/new
  # GET /role_definitions/new.json
  def new
    @role_definition = RoleDefinition.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @role_definition }
    end
  end

  # GET /role_definitions/1/edit
  def edit
    @role_definition = RoleDefinition.find(params[:id])
  end

  # POST /role_definitions
  # POST /role_definitions.json
  def create
    @role_definition = RoleDefinition.new(params[:role_definition])

    respond_to do |format|
      if @role_definition.save
        format.html { redirect_to @role_definition, notice: 'Role definition was successfully created.' }
        format.json { render json: @role_definition, status: :created, location: @role_definition }
      else
        format.html { render action: "new" }
        format.json { render json: @role_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /role_definitions/1
  # PUT /role_definitions/1.json
  def update
    @role_definition = RoleDefinition.find(params[:id])

    respond_to do |format|
      if @role_definition.update_attributes(params[:role_definition])
        format.html { redirect_to @role_definition, notice: 'Role definition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @role_definition.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /role_definitions/1
  # DELETE /role_definitions/1.json
  def destroy
    @role_definition = RoleDefinition.find(params[:id])
    @role_definition.destroy

    respond_to do |format|
      format.html { redirect_to role_definitions_url }
      format.json { head :no_content }
    end
  end
end
