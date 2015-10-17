require 'rails_helper'

RSpec.describe PhoneType, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:phone_type)).to be_valid
  end
  
  it "must have a phone type" do
    expect(FactoryGirl.build(:phone_type, :phone_type => nil)).to be_invalid
  end
  
  it "must not allow duplicate phone types" do
    expect(FactoryGirl.create(:phone_type, :phone_type => "This Type")).to be_valid
    expect(FactoryGirl.build(:phone_type, :phone_type => "This Type")).to be_invalid
  end
end
