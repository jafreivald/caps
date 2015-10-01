class ResourceAuthorization < ActiveRecord::Base
  belongs_to :role_definition
  belongs_to :resource
  # attr_accessible :title, :body
end
