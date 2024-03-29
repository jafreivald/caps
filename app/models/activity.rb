class Activity < ActiveRecord::Base
  nilify_blanks
  
  belongs_to :severity_level
  belongs_to :role_definition
  belongs_to :activity_type
  
  attr_accessible :base_time, :repeat_rule, :activity_type_id, :severity_level_id, :role_definition_id
  
  validates :severity_level, :activity_type, :role_definition, :base_time, :presence => true
  
  def date 
    self.base_time.to_date
  end
  
  def today?
    schedule = Schedule.new(self.base_time)
    schedule.rrule(self.repeat_rule) if self.repeat_rule 
    schedule.occurs_on?(Date.today)
  end

  def occurs_on?(d)
    schedule = IceCube::Schedule.new(self.base_time)
    if self.repeat_rule
      schedule.rrule(self.repeat_rule)  
    end
    schedule.occurs_on?(d)
  end
 
  private
  def import_base_time_string
    if self.base_time_string
      self.base_time = self.base_time_string.to_datetime
    end
  end
end
