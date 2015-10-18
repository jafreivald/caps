class FhirBaseUrlsController < ApplicationController
  before_filter :authorize
  
  # GET /fhir_base_urls
  # GET /fhir_base_urls.json
  def index
    @fhir_base_urls = FhirBaseUrl.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fhir_base_urls }
    end
  end

  # GET /fhir_base_urls/1
  # GET /fhir_base_urls/1.json
  def show
    @fhir_base_url = FhirBaseUrl.find(params[:id])

    respond_to do |format|
      format.html { redirect_to :action => :edit }
      format.json { render json: @fhir_base_url }
    end
  end

  # GET /fhir_base_urls/new
  # GET /fhir_base_urls/new.json
  def new
    @fhir_base_url = FhirBaseUrl.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fhir_base_url }
    end
  end

  # GET /fhir_base_urls/1/edit
  def edit
    @fhir_base_url = FhirBaseUrl.find(params[:id])
  end

  # POST /fhir_base_urls
  # POST /fhir_base_urls.json
  def create
    @fhir_base_url = FhirBaseUrl.new(params[:fhir_base_url])

    respond_to do |format|
      if @fhir_base_url.save
        format.html { redirect_to @fhir_base_url, notice: 'Fhir base url was successfully created.' }
        format.json { render json: @fhir_base_url, status: :created, location: @fhir_base_url }
      else
        format.html { render action: "new" }
        format.json { render json: @fhir_base_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fhir_base_urls/1
  # PUT /fhir_base_urls/1.json
  def update
    @fhir_base_url = FhirBaseUrl.find(params[:id])

    respond_to do |format|
      if @fhir_base_url.update_attributes(params[:fhir_base_url])
        format.html { redirect_to @fhir_base_url, notice: 'Fhir base url was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fhir_base_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fhir_base_urls/1
  # DELETE /fhir_base_urls/1.json
  def destroy
    begin
      @fhir_base_url = FhirBaseUrl.find(params[:id])
      @fhir_base_url.destroy
    rescue ActiveRecord::DeleteRestrictionError
      flash[:"alert-danger"] = "Could not delete the URL because there are resources assigned to it."
      redirect_to resources_path
      return
    end

    respond_to do |format|
      format.html { redirect_to fhir_base_urls_url }
      format.json { head :no_content }
    end
  end
end
