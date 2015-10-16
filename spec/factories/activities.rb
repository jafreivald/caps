FactoryGirl.define do
  factory :activity do
    base_time Faker::Time.backward(14, :morning)
    repeat_rule "CREATE A REPEAT RULE IN THE FACTORY"
    association :severity_level, factory: :severity_level
    association :role_definition, factory: :role_definition
    association :activity_type, factory: :activity_type
  end

end
