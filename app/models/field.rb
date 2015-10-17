class Field < ActiveRecord::Base
  belongs_to :resource
  attr_accessible :field_text, :field_type
  
  validates :field_text, :field_type, :resource, :presence => true
end
