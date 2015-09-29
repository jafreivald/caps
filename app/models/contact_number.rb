class ContactNumber < ActiveRecord::Base
  belongs_to :contact_method
  belongs_to :phone_number
  belongs_to :profile
  attr_accessible :preferred
end
