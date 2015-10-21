class ResourceAuthorization < ActiveRecord::Base
  nilify_blanks

  attr_accessible :role_definition_id, :resource_id
  
  belongs_to :role_definition
  belongs_to :resource
  
  validates :role_definition, :resource, :presence => true
  validates_uniqueness_of :resource_id, :scope => [:role_definition_id]
end
