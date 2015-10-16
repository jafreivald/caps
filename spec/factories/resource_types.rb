require 'faker'

FactoryGirl.define do
  factory :resource_type do |f|
    f.resource_type {Faker::Lorem.word}
  end

end
