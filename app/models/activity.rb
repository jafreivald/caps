class Activity < ActiveRecord::Base
  belongs_to :severity_level
  belongs_to :role_definition
  belongs_to :activity_type
  attr_accessible :base_time, :repeat_rule
end
