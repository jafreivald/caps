class PhoneType < ActiveRecord::Base
  attr_accessible :phone_type
  
  validates :phone_type, :uniqueness => true, :presence => true
end
