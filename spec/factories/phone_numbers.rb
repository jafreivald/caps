require 'faker'

FactoryGirl.define do
  factory :phone_number do |f|
    f.country_code "1"
    f.area_code Faker::PhoneNumber.area_code
    f.number Faker::PhoneNumber.exchange_code + "-" + Faker::PhoneNumber.subscriber_number
    association :phone_provider
    association :phone_type
  end

end
