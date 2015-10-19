class Role < ActiveRecord::Base
  nilify_blanks

  attr_accessible :role
  
  validates :role, :uniqueness => true, :presence => true
end
