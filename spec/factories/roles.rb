require 'faker'

FactoryGirl.define do
  factory :role do |f|
    f.role {Faker::Name.title}
  end

end
