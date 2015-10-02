class PhoneTypesController < ApplicationController
  # GET /phone_types
  # GET /phone_types.json
  def index
    @phone_types = PhoneType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @phone_types }
    end
  end

  # GET /phone_types/1
  # GET /phone_types/1.json
  def show
    @phone_type = PhoneType.find(params[:id])

    respond_to do |format|
      format.html { redirect_to :action => :edit }
      format.json { render json: @phone_type }
    end
  end

  # GET /phone_types/new
  # GET /phone_types/new.json
  def new
    @phone_type = PhoneType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @phone_type }
    end
  end

  # GET /phone_types/1/edit
  def edit
    @phone_type = PhoneType.find(params[:id])
  end

  # POST /phone_types
  # POST /phone_types.json
  def create
    @phone_type = PhoneType.new(params[:phone_type])

    respond_to do |format|
      if @phone_type.save
        format.html { redirect_to @phone_type, notice: 'Phone type was successfully created.' }
        format.json { render json: @phone_type, status: :created, location: @phone_type }
      else
        format.html { render action: "new" }
        format.json { render json: @phone_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /phone_types/1
  # PUT /phone_types/1.json
  def update
    @phone_type = PhoneType.find(params[:id])

    respond_to do |format|
      if @phone_type.update_attributes(params[:phone_type])
        format.html { redirect_to @phone_type, notice: 'Phone type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @phone_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phone_types/1
  # DELETE /phone_types/1.json
  def destroy
    @phone_type = PhoneType.find(params[:id])
    @phone_type.destroy

    respond_to do |format|
      format.html { redirect_to phone_types_url }
      format.json { head :no_content }
    end
  end
end
