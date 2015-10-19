class ActivityType < ActiveRecord::Base
  nilify_blanks

  attr_accessible :activity_type
  
  validates :activity_type, :presence => true
  validates_uniqueness_of :activity_type
end
