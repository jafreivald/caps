require 'faker'

FactoryGirl.define do
  factory :contact_method do |f|
    f.contact_method { Faker::Lorem.word }
  end

end
