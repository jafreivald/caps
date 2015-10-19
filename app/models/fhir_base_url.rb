class FhirBaseUrl < ActiveRecord::Base
  nilify_blanks

  attr_accessible :fhir_base_url
  
  has_many :resources, :dependent => :restrict
  
  validates :fhir_base_url, :presence => true
  validates_uniqueness_of :fhir_base_url
end
