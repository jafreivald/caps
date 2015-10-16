FactoryGirl.define do
  factory :resource_authorization do
    association :role_definition
    association :resource
  end

end
