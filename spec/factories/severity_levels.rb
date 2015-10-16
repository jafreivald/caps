require 'faker'

FactoryGirl.define do
  factory :severity_level do |f|
    f.severity_level { Faker::Number.number(25).to_s }
  end

end
