class ActivityUpdate < ActiveRecord::Base
  nilify_blanks

  belongs_to :activity
  belongs_to :profile
  belongs_to :action
  
  attr_accessible :narrative
  
  validates :activity, :profile, :action, :narrative, :presence => true
end
