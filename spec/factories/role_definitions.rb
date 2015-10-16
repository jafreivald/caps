FactoryGirl.define do
  factory :role_definition do
    association :role
    association :profile
    association :resource_utilization
  end
end
