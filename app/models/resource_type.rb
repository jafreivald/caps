class ResourceType < ActiveRecord::Base
  attr_accessible :resource_type
  
  validates :resource_type, :presence => true, :uniqueness => true
end
