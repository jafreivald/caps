require 'rails_helper'

RSpec.describe Activity, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:activity)).to be_valid
  end
  
  it "must have a severity level" do
    expect(FactoryGirl.build(:activity, :severity_level => nil)).to be_invalid
  end
  
  it "must have an activity type" do
    expect(FactoryGirl.build(:activity, :activity_type => nil)).to be_invalid
  end
  
  it "must have a role definition" do
    expect(FactoryGirl.build(:activity, :role_definition => nil)).to be_invalid
  end
  
  it "must have a base time" do
    expect(FactoryGirl.build(:activity, :base_time => nil)).to be_invalid
  end
  
  it "may have a repeat rule" do
    expect(FactoryGirl.build(:activity, :repeat_rule => nil)).to be_valid
  end
end
