require 'rails_helper'

RSpec.describe ResourceType, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:resource_type)).to be_valid
  end
  
  it "must have an activity type" do
    expect(FactoryGirl.build(:resource_type, :resource_type => nil)).to be_invalid
  end
  
  it "must not allow duplicate activity types" do
    expect(FactoryGirl.create(:resource_type, :resource_type => "Resource")).to be_valid
    expect(FactoryGirl.build(:resource_type, :resource_type => "Resource")).to be_invalid
  end
end
