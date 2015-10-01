class RoleDefinition < ActiveRecord::Base
  attr_accessible :patient_profile_id, :role_id, :profile_id
  
  belongs_to :patient_profile, class_name: "Profile"
  belongs_to :role
  belongs_to :profile
  belongs_to :resource_utilization
  
  has_many :resource_authorizations
  has_many :resources, :through => :resource_authorizations
  
  
  
  def role_information
    "Patient: " + self.patient_profile.full_name + ", Role: " + self.role.role + ", Role Profile: " + profile.full_name
  end
end
