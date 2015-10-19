class Action < ActiveRecord::Base
  nilify_blanks

  attr_accessible :action
  
  validates :action, :presence => true
end
