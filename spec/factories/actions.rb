require 'faker'

FactoryGirl.define do
  factory :action do
    action Faker::Lorem.sentence
  end

end
