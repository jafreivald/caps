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

  def rest_link
    self.fhir_base_url.fhir_base_url + self.resource_type.resource_type + "?_id=" + self.fhir_resource_id.to_s
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
  
  def resource_label
      case self.resource_type.resource_type
      when "Patient"
        retval = "Given Names: " + Field.where(:resource_id => self.id, :field_type => "givenName").map { |f| f.field_text + " " }.join(",") + "Family Names: " + Field.where(:resource_id => self.id, :field_type => "familyName").map { |f| f.field_text + " " }.join(",")
      when "Medication" 
        retval = Field.where(:resource_id => self.id, :field_type => "name").map { |f| f.field_text + " " }.join(",")
      when "Condition"
        retval = Field.where(:resource_id => self.id, :field_type => "clinicalStatus").map { |f| f.field_text + " " }.join(",")
      when "Encounter" 
        retval = Field.where(:resource_id => self.id, :field_type => "serviceProvider").map { |f| f.field_text + " " }.join(",") + Field.where(:resource_id => self.id, :field_type => "start").map { |f| f.field_text + " " }.join(",")
      when "MedicationDispense" 
        f = Field.where(:resource_id => self.id, :field_type => "medication").first
        rt = ResourceType.find_by_resource_type(f.field_text.split("/")[0])
        ref = Resource.where(:resource_type_id => rt.id, :fhir_bae_url_id => self.fhir_base_url_id, :fhir_resource_id => f.field_text.split("/")[1])
        if ref.nil?
          retval = ActionController::Base.helpers.link_to "Import Medication", Rails.application.routes.url_helpers.import_resource_path(self, :fhir_reference => f.field_text), { :method => :post, :class => "btn btn-info" }
        else
          retval = ref.resource_label
        end
        retval += " Prepared: " + Field.where(:resource_id => self.id, :field_text => "whenPrepared").map { |f| f.field_text + " " }.join(",")
      when "MedicationPrescription"
        f = Field.where(:resource_id => self.id, :field_type => "medication").first
        ref = Resource.where(:resource_type_id => ResourceType.find_by_resource_type(f.field_text.split("/")[0]).id, :fhir_bae_url_id => self.fhir_base_url_id, :fhir_resource_id => f.field_text.split("/")[1])
        if ref.nil?
          retval = ActionController::Base.helpers.link_to "Import Prescription", Rails.application.routes.url_helpers.import_resource_path(self, :fhir_reference => f.field_text), { :method => :post, :class => "btn btn-info" }
        else
          retval = ref.resource_label
        end
      when "Observation"
        retval = Field.where(:resource_id => self.id, :field_type => "value")..map { |f| f.field_text + " " }.join(",")
      end
      retval
  end
  
  def resource_info
    r_id = "FHIR Resource Type: " + self.resource_type.resource_type
    Field.where(:resource_id => self.id).each do |f|
      #debugger
      case f.field_type
      when "patient", "medication", "condition", "encounter", "medicationDispense", "medicationPrescription", "observation" 
        rt = ResourceType.find_by_resource_type(f.field_text.split("/")[0])
        if rt != nil
          res = Resource.where(:fhir_base_url_id => self.fhir_base_url_id, :resource_type_id => rt.id, :fhir_resource_id => f.field_text.split("/")[1])
        end
        if res.any?
          res.each do |r|
            r_id += ("<div>" + f.field_type + "=" + res.map { |r| r.resource_label }.join(",") + "</div>" )
          end
        else
          r_id += "<div>"
          r_id += ActionController::Base.helpers.link_to "Import " + f.field_text, Rails.application.routes.url_helpers.import_resource_path(self, :fhir_reference => f.field_text), { :method => :post, :class => "btn btn-info" }
          r_id += "</div>"
        end
      else
        r_id += ("<div>" + f.field_type + "=" + f.field_text + "</div>" )
      end
    end
    r_id
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
