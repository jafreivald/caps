class PhoneType < ActiveRecord::Base
  nilify_blanks

  attr_accessible :phone_type
  
  validates :phone_type, :uniqueness => true, :presence => true
end
