require 'faker'

FactoryGirl.define do
  factory :activity_type do |f|
    f.activity_type { Faker::Lorem.word }
  end
end
