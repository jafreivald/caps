require 'faker'

FactoryGirl.define do
  factory :contact_number do |f|
    f.preferred true
    association :phone_number
    association :contact_method
    association :profile
  end

end
