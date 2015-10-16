require 'faker'

FactoryGirl.define do
  factory :field do |f|
    f.field_type {Faker::Lorem.word}
    f.field_text {Faker::Lorem.word}
    association :resource
  end

end
