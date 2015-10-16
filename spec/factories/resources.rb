FactoryGirl.define do
  factory :resource do
    resource Faker::Commerce.product_name
  end
end
