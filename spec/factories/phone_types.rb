require 'faker'

FactoryGirl.define do
  factory :phone_type do |f|
    f.phone_type {Faker::Lorem.word}
  end

end
