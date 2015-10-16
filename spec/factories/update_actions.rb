require 'faker'

FactoryGirl.define do
  factory :update_action do |f|
    f.update_action {Faker::Lorem.word}
  end

end
