FactoryGirl.define do
  factory :fhir_base_url do
    fhir_base_url Faker::Internet.url
  end

end
