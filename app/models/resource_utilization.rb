class ResourceUtilization < ActiveRecord::Base
  nilify_blanks

  belongs_to :resource
  belongs_to :activity
  
  validates :resource, :activity, :presence => true
  # attr_accessible :title, :body
end
