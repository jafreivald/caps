require 'rails_helper'

RSpec.describe ResourceUtilization, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:resource_utilization)).to be_valid
  end
  
  it "must have an activity" do
    expect(FactoryGirl.build(:resource_utilization, :activity => nil)).to be_invalid
  end
  
  it "must have a resource" do
    expect(FactoryGirl.build(:resource_utilization, :resource => nil)).to be_invalid
  end
end