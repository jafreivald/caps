require 'faker'

FactoryGirl.define do
  factory :fhir_base_url do |f|
    f.fhir_base_url { Faker::Internet.url }
  end

end
