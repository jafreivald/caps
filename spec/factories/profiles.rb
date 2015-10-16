require 'faker'

FactoryGirl.define do
  factory :profile do |p|
    p.first_name { Faker::Name.first_name }
    p.last_name { Faker::Name.last_name }
    p.email { Faker::Internet.email }
    p.userid { Faker::Internet.user_name }
    p.password "password"
    p.password_confirmation "password"
    p.password_reset_token { Faker::Number.number(64) }
  end

end
