require 'rails_helper'

RSpec.describe ActivityType, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:activity_type)).to be_valid
  end
  
  it "must have an activity type" do
    expect(FactoryGirl.build(:activity_type, :activity_type => nil)).to be_invalid
  end
  
  it "must not allow duplicate activity types" do
    expect(FactoryGirl.create(:activity_type, :activity_type => "This Activity")).to be_valid
    expect(FactoryGirl.build(:activity_type, :activity_type => "This Activity")).to be_invalid
  end
end
