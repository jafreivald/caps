require 'faker'

FactoryGirl.define do
  factory :action do |f|
    f.action { Faker::Lorem.sentence }
  end
end
