require 'faker'

FactoryGirl.define do
  factory :activity do |f|
    f.base_time { Faker::Time.backward(14, :morning) }
    f.repeat_rule { Faker::Lorem.words(6) }
    association :severity_level
    association :role_definition
    association :activity_type
  end

end
