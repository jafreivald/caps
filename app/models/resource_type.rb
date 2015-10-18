class ResourceType < ActiveRecord::Base
  attr_accessible :resource_type
  
  has_many :resources, :dependent => :restrict
  
  validates :resource_type, :presence => true, :uniqueness => true
end
