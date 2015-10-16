class Activity < ActiveRecord::Base
  belongs_to :severity_level
  belongs_to :role_definition
  belongs_to :activity_type
  
  attr_accessible :base_time, :repeat_rule
  
  validates :severity_level, :activity_type, :role_definition, :base_time, :repeat_rule, :presence => true
end
