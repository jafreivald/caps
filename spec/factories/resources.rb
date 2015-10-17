require 'faker'

FactoryGirl.define do
  factory :resource do |f|
    f.fhir_resource_id { Faker::Number.number(2)}
    association :resource_type
    association :fhir_base_url
  end
  factory :patient_resource, :class => :resource do |f|
    f.fhir_resource_id { Faker::Number.number(2) }
    f.resource_type { ResourceType.where(:resource_type => "Patient").first_or_create()}
    association :fhir_base_url
  end
end
