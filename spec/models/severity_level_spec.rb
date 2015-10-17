require 'rails_helper'

RSpec.describe SeverityLevel, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:severity_level)).to be_valid
  end
  
  it "must have a severity level" do
    expect(FactoryGirl.build(:severity_level, :severity_level => nil)).to be_invalid
  end
  
  it "must not allow duplicate severity levels" do
    expect(FactoryGirl.create(:severity_level, :severity_level => "SeverityLevelHigh")).to be_valid
    expect(FactoryGirl.build(:severity_level, :severity_level => "SeverityLevelHigh")).to be_invalid
  end
end
