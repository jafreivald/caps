class PhoneNumber < ActiveRecord::Base
  belongs_to :phone_provider
  belongs_to :phone_type
  attr_accessible :area_code, :country_code, :number
  
  validates :phone_type, :area_code, :country_code, :number, :presence => true
  
end
