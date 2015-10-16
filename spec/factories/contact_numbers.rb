FactoryGirl.define do
  factory :contact_number do
    preferred false
    association :phone_number
    association :contact_method
    association :profile
  end

end
