class ResourceUtilization < ActiveRecord::Base
  belongs_to :resource
  belongs_to :fhir_base_url
  # attr_accessible :title, :body
end
