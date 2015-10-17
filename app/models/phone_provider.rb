class PhoneProvider < ActiveRecord::Base
  attr_accessible :phone_provider
  
  validates :phone_provider, :uniqueness => true, :presence => true
end
