class ActivityType < ActiveRecord::Base
  attr_accessible :activity_type
  
  validates :activity_type, :presence => true
  validates_uniqueness_of :activity_type
end
