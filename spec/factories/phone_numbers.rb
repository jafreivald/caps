FactoryGirl.define do
  factory :phone_number do
    country_code "1"
    area_code Faker::PhoneNumber.area_code
    number Faker::PhoneNumber.exchange_code + "-" + Faker::PhoneNumber.subscriber_number
    association :phone_provider
    association :phone_type
  end

end
