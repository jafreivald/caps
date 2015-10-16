FactoryGirl.define do
  factory :resource_utilization do
    association :resource
    association :fhir_base_url
  end
end
