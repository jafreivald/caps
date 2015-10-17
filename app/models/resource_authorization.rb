class ResourceAuthorization < ActiveRecord::Base
  attr_accessible :role_definition_id, :resource_id
  
  belongs_to :role_definition
  belongs_to :resource
  
  validates :role_definition, :resource, :presence => true
end
