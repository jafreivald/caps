class ResourceUtilization < ActiveRecord::Base
  belongs_to :resource
  belongs_to :activity
  
  validates :resource, :activity, :presence => true
  # attr_accessible :title, :body
end
