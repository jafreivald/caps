require 'faker'

FactoryGirl.define do
  factory :phone_provider do |f|
    f.phone_provider { Faker::Company.name }
  end

end
