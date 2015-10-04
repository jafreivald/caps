class ResourcesController < ApplicationController
  # GET /resources
  # GET /resources.json
  def index
    @resources = Resource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @resources }
    end
  end

  # GET /resources/1
  # GET /resources/1.json
  def show
    @resource = Resource.find(params[:id])

    respond_to do |format|
      format.html { redirect_to :action => :edit }
      format.json { render json: @resource }
    end
  end

  # GET /resources/new
  # GET /resources/new.json
  def new
    @resource = Resource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @resource }
    end
  end

  # GET /resources/1/edit
  def edit
    @resource = Resource.find(params[:id])
    if @resource.resource_type.resource_type == "Patient"
      prts = Array.new(["Condition", "Encounter", "MedicationDispense", "MedicationPrescription", "Observation"])
      @patient_related_resource_types = ResourceType.where( :resource_type => prts)
    end
  end

  def import
    @resource = Resource.find(params[:id])
    @resource_type = ResourceType.find(params[:resource_type_id])
    import_patient_resources
    redirect_to :action => :index
  end
  
  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.new(params[:resource])

    respond_to do |format|
      if @resource.save
        if @resource.resource_type.resource_type == "Patient"
          update_patient_resources
        end
        format.html { redirect_to @resource, notice: 'Resource was successfully created.' }
        format.json { render json: @resource, status: :created, location: @resource }
      else
        format.html { render action: "new" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resources/1
  # PUT /resources/1.json
  def update
    @resource = Resource.find(params[:id])

    respond_to do |format|
      if @resource.update_attributes(params[:resource])
        if @resource.resource_type.resource_type == "Patient"
          update_patient_resources
        end
        format.html { redirect_to @resource, notice: 'Resource was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resources/1
  # DELETE /resources/1.json
  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy

    respond_to do |format|
      format.html { redirect_to resources_url }
      format.json { head :no_content }
    end
  end
  
  def import_patient_resources
    rr = Array.new
    if @resource.resource_type.resource_type == "Patient"
      related_rest_resources = Array.new
      related_rest_resources.append(JSON.parse(RestClient.get @resource.fhir_base_url.fhir_base_url + @resource_type.resource_type, { :params => { :patient => @resource.fhir_resource_id }, :accept => :json }))
      related_rest_resources.each do |r|
        r["entry"].each do |e|
          rr.append(Resource.where(:resource_type_id => @resource_type.id, :fhir_base_url_id => @resource.fhir_base_url_id, :fhir_resource_id => e["resource"]["id"].to_i).first_or_create())
        end
      end
    end
    rr.flatten.compact
  end
end
