class RoleDefinition < ActiveRecord::Base
  belongs_to :role
  belongs_to :profile
  belongs_to :resource_utilization
  # attr_accessible :title, :body
end
