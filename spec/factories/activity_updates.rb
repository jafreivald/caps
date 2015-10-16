FactoryGirl.define do
  factory :activity_update do |f|
    f.narrative Faker::Lorem.paragraph
    association :activity
    association :profile
    association :action
  end

end
