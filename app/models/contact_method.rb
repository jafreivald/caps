class ContactMethod < ActiveRecord::Base
  nilify_blanks

  attr_accessible :contact_method
  
  validates :contact_method, :presence => true
  validates_uniqueness_of :contact_method
end
