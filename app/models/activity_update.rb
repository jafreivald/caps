class ActivityUpdate < ActiveRecord::Base
  belongs_to :activity
  belongs_to :profile
  belongs_to :action
  attr_accessible :narrative
end
