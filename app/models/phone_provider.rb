class PhoneProvider < ActiveRecord::Base
  nilify_blanks

  attr_accessible :phone_provider
  
  validates :phone_provider, :uniqueness => true, :presence => true
end
