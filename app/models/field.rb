class Field < ActiveRecord::Base
  nilify_blanks

  belongs_to :resource
  attr_accessible :field_text, :field_type
  
  validates :field_text, :field_type, :resource, :presence => true
end
