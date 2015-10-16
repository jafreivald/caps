require 'faker'

FactoryGirl.define do
  factory :resource_utilization do |f|
    association :resource
    association :activity
  end
end
