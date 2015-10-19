class UpdateAction < ActiveRecord::Base
  nilify_blanks

  attr_accessible :update_action
  
  validates :update_action, :presence => true, :uniqueness => true
end
