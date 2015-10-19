class SeverityLevel < ActiveRecord::Base
  nilify_blanks

  attr_accessible :severity_level
  
  validates :severity_level, :presence => true, :uniqueness => true
end
