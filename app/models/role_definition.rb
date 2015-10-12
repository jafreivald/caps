class RoleDefinition < ActiveRecord::Base
  attr_accessible :patient_profile_id, :role_id, :profile_id

  belongs_to :role
  belongs_to :profile
  
  has_many :resource_authorizations
  has_many :resources, :through => :resource_authorizations
  
  validates :role, :presence => true
  validates :profile, :presence => true
  
  def role_information
    "Profile: " + (self.profile.nil? ? "Unassigned" : self.profile.full_name) + ", Role: " + (self.role.nil? ? "Unassigned" : self.role.role)
  end
end
