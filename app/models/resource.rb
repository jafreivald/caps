class Resource < ActiveRecord::Base
  require 'rest-client'
  
  attr_accessible :resource
  
  belongs_to :resource_type
  belongs_to :fhir_base_url
  
  has_many :role_definitions
  has_many :resource_utilizations
  
  validates :resource_type_id, :fhir_base_url_id, :fhir_resource_id, :presence => true
  validates_associated :resource_type, :fhir_base_urlS
  validates_uniqueness_of :fhir_resource_id, :scope => [ :fhir_base_url_id, :resource_type_id ]
  
  def resource_identifier
    self.rest_resource['link'].first['url']
  end
  
  def rest_resource
    begin
      @rest_resource ||= JSON.parse(RestClient.get self.fhir_base_url.fhir_base_url + self.resource_type.resource_type, { :params => { :_id => self.fhir_resource_id }, :accept => :json })
    rescue => e
      self.errors.add(:error, "Unable to fetch resource data from server")
      e.response
    end
  end
  
  def rest_ids
    ids = Array.new
    rest_resource["entry"].each do |e|
      ids.append(e["resource"]["id"])
    end
    ids
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
