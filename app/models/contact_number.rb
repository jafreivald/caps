class ContactNumber < ActiveRecord::Base
  before_validation do
    default_preferred
  end
  
  belongs_to :contact_method
  belongs_to :phone_number
  belongs_to :profile
  attr_accessible :preferred
  
  validates :contact_method, :phone_number, :profile, :presence => true
  
  private
  def default_preferred
    self.preferred = true if self.preferred.nil?
  end
end
