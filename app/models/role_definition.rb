class RoleDefinition < ActiveRecord::Base
  nilify_blanks
  
  before_validation do
    validate_patient_resource
  end
  
  attr_accessible :patient_resource_id, :role_id, :profile_id

  belongs_to :role
  belongs_to :profile
  belongs_to :patient_resource, :class_name => 'Resource', :inverse_of => :patient_role_definitions
  
  has_many :resource_authorizations
  has_many :resources, :through => :resource_authorizations
  
  validates :profile, :role, :patient_resource, :presence => true
  validates_uniqueness_of :role_id, :scope => [ :profile_id, :patient_resource_id ]
  
  
  
  def role_information
    "Profile: " + self.profile.full_name + ", Role: " + self.role.role + "Patient: " + (self.patient_resource.resource_label.nil? ? self.patient_resource.resource_type.resource_type : self.patient_resource.resource_label)
  end
  
  private
  
  def validate_patient_resource
    self.patient_resource && self.patient_resource.resource_type && self.patient_resource.resource_type.resource_type == "Patient"
  end
end
