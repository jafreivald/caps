class UpdateAction < ActiveRecord::Base
  attr_accessible :update_action
  
  validates :update_action, :presence => true, :uniqueness => true
end
