FactoryGirl.define do
  factory :field do
    field_type Faker::Lorem.word
    field_text Faker::Lorem.word
    association :resource
  end

end
