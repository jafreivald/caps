class Role < ActiveRecord::Base
  attr_accessible :role
  
  validates :role, :uniqueness => true, :presence => true
end
