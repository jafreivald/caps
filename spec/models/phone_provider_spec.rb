require 'rails_helper'

RSpec.describe PhoneProvider, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:phone_provider)).to be_valid
  end
  
  it "must have a phone provider" do
    expect(FactoryGirl.build(:phone_provider, :phone_provider => nil)).to be_invalid
  end
  
  it "must not allow duplicate phone providers" do
    expect(FactoryGirl.create(:phone_provider, :phone_provider => "This Provider")).to be_valid
    expect(FactoryGirl.build(:phone_provider, :phone_provider => "This Provider")).to be_invalid
  end
end
