require 'faker'

FactoryGirl.define do
  factory :profile do |f|
    f.first_name { Faker::Name.first_name }
    f.last_name { Faker::Name.last_name }
    f.email { Faker::Internet.email }
    f.userid { Faker::Internet.user_name + Faker::Number.number(4).to_s }
    f.password "password"
    f.password_confirmation "password"
    f.password_reset_token { Faker::Number.number(64) }
    f.password_reset_sent_at { 6.hour.ago }
  end

end
