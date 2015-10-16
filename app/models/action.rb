class Action < ActiveRecord::Base
  attr_accessible :action
  
  validates :action, :presence => true
end
