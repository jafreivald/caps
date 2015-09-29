class PhoneProvidersController < ApplicationController
  # GET /phone_providers
  # GET /phone_providers.json
  def index
    @phone_providers = PhoneProvider.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @phone_providers }
    end
  end

  # GET /phone_providers/1
  # GET /phone_providers/1.json
  def show
    @phone_provider = PhoneProvider.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @phone_provider }
    end
  end

  # GET /phone_providers/new
  # GET /phone_providers/new.json
  def new
    @phone_provider = PhoneProvider.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @phone_provider }
    end
  end

  # GET /phone_providers/1/edit
  def edit
    @phone_provider = PhoneProvider.find(params[:id])
  end

  # POST /phone_providers
  # POST /phone_providers.json
  def create
    @phone_provider = PhoneProvider.new(params[:phone_provider])

    respond_to do |format|
      if @phone_provider.save
        format.html { redirect_to @phone_provider, notice: 'Phone provider was successfully created.' }
        format.json { render json: @phone_provider, status: :created, location: @phone_provider }
      else
        format.html { render action: "new" }
        format.json { render json: @phone_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /phone_providers/1
  # PUT /phone_providers/1.json
  def update
    @phone_provider = PhoneProvider.find(params[:id])

    respond_to do |format|
      if @phone_provider.update_attributes(params[:phone_provider])
        format.html { redirect_to @phone_provider, notice: 'Phone provider was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @phone_provider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /phone_providers/1
  # DELETE /phone_providers/1.json
  def destroy
    @phone_provider = PhoneProvider.find(params[:id])
    @phone_provider.destroy

    respond_to do |format|
      format.html { redirect_to phone_providers_url }
      format.json { head :no_content }
    end
  end
end
