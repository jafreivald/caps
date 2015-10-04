class Resource < ActiveRecord::Base
  require 'rest-client'
  
  attr_accessible :fhir_base_url_id, :resource_type_id, :fhir_resource_id
  
  belongs_to :resource_type
  belongs_to :fhir_base_url
  
  has_many :role_definitions
  has_many :resource_utilizations
  
  validates :resource_type_id, :fhir_base_url_id, :fhir_resource_id, :presence => true
  validates_associated :resource_type, :fhir_base_url
  validates_uniqueness_of :fhir_resource_id, :scope => [ :fhir_base_url_id, :resource_type_id ]
  
  def rest_resource
    begin
      @rest_resource ||= JSON.parse(RestClient.get self.fhir_base_url.fhir_base_url + self.resource_type.resource_type, { :params => { :_id => self.fhir_resource_id }, :accept => :json })
    rescue => e
      self.errors.add(:error, "Unable to fetch resource data from server")
      e
    end
  end

  def rest_resource_identifier
    resource_identifier
  end
  
  def rest_resource_info
    ri = Array.new
    rest_resource["entry"].each do |e|
      r = e["resource"]
      begin
        rt = r["resourceType"]
        case rt
        when "Person"
          ri.append(r["text"]["div"])
        when "Condition"
          ri.append(r["notes"])
        when "Encounter"
          ri.append("<strong>Start:</strong> " + r["period"]["start"].to_s + " <strong>End:</strong> " + r["period"]["end"].to_s + " <strong>Location:</strong> " + r["location"].first["location"]["reference"].to_s + " - locations not referenced in GA Tech FHIR interface" )
        when "Medication"
          ri.append(r)
        when "MedicationDispense"
          ri.append("Medication: " + r["medication"]["reference"].to_s + " Qty: " + r["quantity"]["value"].to_s + r["quantity"]["units"].to_s + " for " + r["daysSupply"]["value"].to_s + " days, Received on: " + r["whenPrepared"].to_s)
        when "MedicationPrescription"
          #debugger
          ri.append("Medication: " + r["medication"]["reference"].to_s + " Dose: " + r["dosageInstruction"].first["doseQuantity"]["value"].to_s +  r["dosageInstruction"].first["doseQuantity"]["units"].to_s + " Qty: " +  r["dispense"]["quantity"]["value"].to_s )
        when "Observation"
          ri.append(r["code"]["coding"].first["display"].to_s + ": " + (r["valueString"] ? r["valueString"] : r["valueQuantity"]["value"].to_s + " " + r["valueQuantity"]["units"].to_s))
        end
      rescue
        ri.append("<strong>Error Parsing FHIR data: </strong>" + r.to_s)
      end
    end
    ri
  end
  
  def rest_resource_pretty
    begin
      JSON.pretty_generate (@pretty_rest_resource ||= JSON.parse(RestClient.get self.fhir_base_url.fhir_base_url + self.resource_type.resource_type, { :params => { :_id => self.fhir_resource_id }, :accept => :json }))
    rescue => e
      self.errors.add(:error, "Unable to fetch resource data from server")
      e
    end
  end  
  
  def rest_resource_ids
    ids = Array.new
    rest_resource["entry"].each do |e|
      ids.append(e["resource"]["id"])
    end
    ids
  end
  
  def rest_resource_types
    rts = Array.new
    rest_resource["entry"].each do |e|
      rts.append(e["resource"]["resourceType"])
    end
    rts
  end
  
  def resource_identifier
    self.rest_resource['link'].first['url']
  end
  
  def entries
    rest_resource["entry"]
  end
  
  def patient_full_name
    if self.resource_type.nil? || self.resource_type.resource_type != "Patient"
      self.errors.add(:error, "Not a Patient resource")
    else
      name_list = Array.new
      names = rest_resource["entry"][0]["resource"]["name"]
      names.each do |n|
        name_list.append (n["given"].first + " " + n["family"].first)
      end
      name_list
    end
  end
  
end
