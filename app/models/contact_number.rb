class ContactNumber < ActiveRecord::Base
  belongs_to :contact_method
  belongs_to :phone_number
  belongs_to :profile
  attr_accessible :preferred
  
  validates :contact_method, :phone_number, :profile, :presence => true
end
