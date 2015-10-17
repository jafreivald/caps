class SeverityLevel < ActiveRecord::Base
  attr_accessible :severity_level
  
  validates :severity_level, :presence => true, :uniqueness => true
end
