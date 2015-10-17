require 'rails_helper'

RSpec.describe PhoneNumber, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:phone_number)).to be_valid
  end
  
  it "must have an area code" do
    expect(FactoryGirl.build(:phone_number, :area_code => nil)).to be_invalid
  end
  
  it "must have a country code" do
    expect(FactoryGirl.build(:phone_number, :country_code => nil)).to be_invalid
  end
  
  it "must have a number" do
    expect(FactoryGirl.build(:phone_number, :number => nil)).to be_invalid
  end
  
  it "must have a phone type" do
    expect(FactoryGirl.build(:phone_number, :phone_type => nil)).to be_invalid
  end
  
  it "does not require a phone provider" do
    expect(FactoryGirl.build(:phone_number, :phone_provider => nil)).to be_valid
  end
end
