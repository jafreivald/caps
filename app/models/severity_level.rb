class SeverityLevel < ActiveRecord::Base
  attr_accessible :severity_level
  
  validates_uniqueness_of :severity_level
end
