class ResourcesController < ApplicationController
  before_filter :authorize
  
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
    begin
      @resource = Resource.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      flash[:"alert-warning"] = 'Unable to find selected resource.'
      redirect_to resources_path
      return
    end
    

    if @resource.resource_type.resource_type == "Patient"
      rts = "Encounter", "Condition", "Observation", "MedicationPrescription", "MedicationDispense"
      @resource_types = ResourceType.where(:resource_type => rts)
    end
    @fields = Field.where(:resource_id => @resource.id)
  end

  def search
    @resource = Resource.find(params[:id])
    rt = ResourceType.find(params[:resource_type_id])
    bundle = JSON.parse(RestClient.get @resource.fhir_base_url.fhir_base_url + rt.resource_type, { :params => { @resource.resource_type.resource_type.camelize(:lower) => @resource.fhir_resource_id }, :accept => :json })
    @entries = bundle["entry"].uniq
  end
  
  def import
    @resource = Resource.find(params[:id])
    rt = ResourceType.find_by_resource_type(params[:fhir_reference].split("/")[0])
    fhir_id = params[:fhir_reference].split("/")[1]
        
    rd = RoleDefinition.joins(:resource_authorizations).where(:profile_id => session[:user_id], :resource_authorizations => { :resource_id => @resource.id }).first()
    if rd.nil?
      flash[:"alert-warning"] = 'Unable to import new resource ' + params[:fhir_reference] + '. Profile has no role associated with parent resource.'
      redirect_to resources_path
      return
    end
    
    newresource = Resource.where(:fhir_base_url_id => @resource.fhir_base_url_id, :resource_type_id => rt.id, :fhir_resource_id => fhir_id).first_or_create()
    if !newresource.persisted?
      flash[:"alert-warning"] = 'Unable to import new resource ' + params[:fhir_reference] + '. Resource object is invalid.'
      redirect_to edit_resource_path(@resource)
      return
    end
    
    ra = ResourceAuthorization.where(:role_definition_id => rd.id, :resource_id => newresource.id).first_or_create()
    
    if ra.invalid?
      flash[:"alert-warning"] = 'Unable to import new resource ' + params[:fhir_reference] + '. Unable to create resource authorization for this profile.'
      newresource.destroy
      redirect_to edit_resource_path(@resource)
      return
    end

    bundle = JSON.parse(RestClient.get newresource.fhir_base_url.fhir_base_url + rt.resource_type, { :params => { :_id => fhir_id }, :accept => :json })

    if bundle.nil?
      flash[:"alert-warning"] = 'Unable to import new resource ' + params[:fhir_reference] + '. Remote call to FHIR resource returned no information.'
      newresource.destroy
      redirect_to edit_resource_path(@resource)
      return
    end
    
    import_result = import_bundle(bundle, newresource, rt)
    
    if import_result
      flash[:"alert-warning"] = 'Unable to import new resource ' + params[:fhir_reference] + import_result
      newresource.destroy
      redirect_to edit_resource_path(@resource)
    else
      flash[:"alert-success"] = 'Resource successfully imported.'
      redirect_to edit_resource_path(newresource)
    end
  end
  
  # POST /resources
  # POST /resources.json
  def create
    @resource = Resource.new(params[:resource])
    reason = nil
    if @resource.save
      rl = Role.where(:role => "Resource Creator").first()
      if @resource.resource_type.resource_type == "Patient"
        rd = RoleDefinition.where(:profile_id => session[:user_id], :role_id => rl, :patient_resource_id => @resource.id).first_or_create()
        ra = ResourceAuthorization.where(:role_definition_id => rd.id, :resource_id => @resource.id).first_or_create()
        if !(reason = update_patient_resources).nil?
          @resource.destroy
        end
      else
        np = Resource.where(:resource_type_id => ResourceType.where(:resource_type => "No Patient Assigned").first.id, :fhir_resource_id => -1).first()
        rd = RoleDefinition.where(:profile_id => session[:user_id], :role_id => rl, :patient_resource_id => np).first_or_create()
        ra = ResourceAuthorization.where(:role_definition_id => rd.id, :resource_id => @resource.id).first_or_create()
      end
    end
    respond_to do |format|
      if @resource.persisted?
        format.html { flash[:"alert-success"] = 'Resource was successfully created.'; redirect_to edit_resource_path(@resource) }
        format.json { render json: @resource, status: :created, location: @resource }
      else
        format.html { flash[:"alert-warning"] = 'Error creating resource: ' + reason.to_s; render action: "new" }
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
        format.html { flash[:"alert-success"] = 'Resource was successfully updated.'; redirect_to edit_resource_path(@resource) }
        format.json { head :no_content }
      else
        format.html { flash[:"alert-warning"] = 'Error updating resource.'; render action: "edit" }
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
  
  private
  
  def update_patient_resources
    begin
    bundle = JSON.parse(RestClient.get @resource.fhir_base_url.fhir_base_url + @resource.resource_type.resource_type, { :params => { :_id => @resource.fhir_resource_id }, :accept => :json })
    rescue
      return 'Unable to reach FHIR resource. Please check the URL and resource accessibility.'
    end
    import_bundle(bundle, @resource, @resource.resource_type)
  end
  
  def import_bundle(bundle, nr, rt)
    retval = nil
    ActiveRecord::Base.transaction do
      if bundle["entry"].nil?
        return "No entries in the remote FHIR resource"
      end
      bundle["entry"].each do |e|
        begin
          case rt.resource_type
          when "Patient"
            Field.where(:resource_id => nr.id, :field_type => "familyName", :field_text => e["resource"]["name"].map { |n| n["family"].map { |f| f }.join(", ") }.join).first_or_create()
            Field.where(:resource_id => nr.id, :field_type => "givenName", :field_text => e["resource"]["name"].map { |n| n["given"].map { |f| f }.join(", ") }.join).first_or_create()          
            Field.where(:resource_id => nr.id, :field_type => "birthDate", :field_text => e["resource"]["birthDate"].to_s).first_or_create()          
            Field.where(:resource_id => nr.id, :field_type => "gender", :field_text => e["resource"]["gender"].to_s).first_or_create()          
          when "Condition"
            Field.where(:resource_id => nr.id, :field_type => "patient", :field_text => e["resource"]["patient"]["reference"].to_s).first_or_create()
            Field.where(:resource_id => nr.id, :field_type => "text", :field_text => e["resource"]["code"]["text"].to_s).first_or_create()
            Field.where(:resource_id => nr.id, :field_type => "clinicalStatus", :field_text => e["resource"]["clinicalStatus"].to_s).first_or_create()
            Field.where(:resource_id => nr.id, :field_type => "onsetDateTime", :field_text => e["resource"]["onsetDateTime"].to_s).first_or_create()
            Field.where(:resource_id => nr.id, :field_type => "notes", :field_text => e["resource"]["notes"].to_s).first_or_create()         
          when "Encounter"
            Field.where(:resource_id => nr.id, :field_type => "patient", :field_text => e["resource"]["patient"]["reference"].to_s).first_or_create()
            Field.where(:resource_id => nr.id, :field_type => "class", :field_text => e["resource"]["class"].to_s).first_or_create()
            Field.where(:resource_id => nr.id, :field_type => "episodeOfCare", :field_text => e["resource"]["episodeOfCare"]["reference"].to_s).first_or_create()
            Field.where(:resource_id => nr.id, :field_type => "serviceProvider", :field_text => e["resource"]["serviceProvider"]["reference"].to_s).first_or_create()
            Field.where(:resource_id => nr.id, :field_type => "location", :field_text => e["resource"]["location"].map { |l| l["location"]["reference"] }.join(", ").to_s).first_or_create()
            Field.where(:resource_id => nr.id, :field_type => "start", :field_text => e["resource"]["period"]["start"].to_s).first_or_create()
            Field.where(:resource_id => nr.id, :field_type => "end", :field_text => e["resource"]["period"]["end"].to_s).first_or_create()         
          when "Medication"
            Field.where(:resource_id => nr.id, :field_type => "name", :field_text => e["resource"]["name"]).first_or_create()
          when "MedicationDispense"
            Field.where(:resource_id => nr.id, :field_type => "patient", :field_text => e["resource"]["patient"]["reference"].to_s).first_or_create()
            Field.where(:resource_id => nr.id, :field_type => "quantity_value", :field_text => e["resource"]["quantity"]["value"].to_s).first_or_create()
            Field.where(:resource_id => nr.id, :field_type => "quantity_units", :field_text => e["resource"]["quantity"]["units"].to_s).first_or_create()
            Field.where(:resource_id => nr.id, :field_type => "daysSupply", :field_text => e["resource"]["daysSupply"]["value"].to_s).first_or_create()
            Field.where(:resource_id => nr.id, :field_type => "whenPrepared", :field_text => e["resource"]["whenPrepared"].to_s).first_or_create()
            Field.where(:resource_id => nr.id, :field_type => "medication", :field_text => e["resource"]["medication"]["reference"].to_s).first_or_create()
          when "MedicationPrescription"
            Field.where(:resource_id => nr.id, :field_type => "dateWritten", :field_text => e["resource"]["dateWritten"].to_s).first_or_create() if e["resource"]["dateWritten"]
            Field.where(:resource_id => nr.id, :field_type => "patient", :field_text => e["resource"]["patient"]["reference"].to_s).first_or_create() if e["resource"]["patient"]["reference"]
            Field.where(:resource_id => nr.id, :field_type => "prescriber", :field_text => e["resource"]["prescriber"]["reference"].to_s).first_or_create() if e["resource"]["prescriber"]["reference"]
            Field.where(:resource_id => nr.id, :field_type => "medication", :field_text => e["resource"]["medication"]["reference"].to_s).first_or_create() if e["resource"]["medication"]["reference"]
            Field.where(:resource_id => nr.id, :field_type => "encounter", :field_text => e["resource"]["encounter"]["reference"].to_s).first_or_create() if e["resource"]["encounter"]["reference"]
            Field.where(:resource_id => nr.id, :field_type => "doseQuantity_value", :field_text => e["resource"]["dispense"]["quantity"]["value"].to_s).first_or_create() if e["resource"]["dispense"]["quantity"]["value"]
            Field.where(:resource_id => nr.id, :field_type => "doseQuantity_units", :field_text => e["resource"]["dispense"]["quantity"]["units"].to_s).first_or_create() if e["resource"]["dispense"]["quantity"]["units"]
            Field.where(:resource_id => nr.id, :field_type => "quantity", :field_text => e["resource"]["dispense"]["quantity"]["value"].to_s).first_or_create() if e["resource"]["dispense"]["quantity"]["value"]
            Field.where(:resource_id => nr.id, :field_type => "numberOfRepeatsAllowed", :field_text => e["resource"]["dispense"]["numberOfRepeatsAllowed"].to_s).first_or_create() if e["resource"]["dispense"]["numberOfRepeatsAllowed"]
          when "Observation"
            Field.where(:resource_id => nr.id, :field_type => "patient", :field_text => e["resource"]["patient"]["reference"].to_s).first_or_create()
            Field.where(:resource_id => nr.id, :field_type => "encounter", :field_text => e["resource"]["encounter"]["reference"].to_s).first_or_create()
            Field.where(:resource_id => nr.id, :field_type => "value", :field_text => e["resource"]["valueQuantity"]["value"].to_s).first_or_create()
            Field.where(:resource_id => nr.id, :field_type => "units", :field_text => e["resource"]["valueQuantity"]["units"].to_s).first_or_create()
            Field.where(:resource_id => nr.id, :field_type => "system", :field_text => e["resource"]["valueQuantity"]["system"].to_s).first_or_create()         
            Field.where(:resource_id => nr.id, :field_type => "code", :field_text => e["resource"]["valueQuantity"]["code"].to_s).first_or_create()          
            Field.where(:resource_id => nr.id, :field_type => "appliesDateTime", :field_text => e["resource"]["appliesDateTime"].to_s).first_or_create()        
            Field.where(:resource_id => nr.id, :field_type => "status", :field_text => e["resource"]["status"].to_s).first_or_create()
            Field.where(:resource_id => nr.id, :field_type => "reliability", :field_text => e["resource"]["reliability"].to_s).first_or_create()
          else
            retval = "Unknown Resource Type"
          end
        rescue
        end
      end
    end
    retval
  rescue ActiveRecord::Rollback
    self.errors.add("Import failed.") 
    nil
  end
  
end
