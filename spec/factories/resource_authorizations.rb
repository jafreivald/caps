require 'faker'

FactoryGirl.define do
  factory :resource_authorization do |f|
    association :role_definition
    association :resource
  end

end
