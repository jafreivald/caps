require 'rails_helper'

RSpec.describe Role, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:role)).to be_valid
  end
  
  it "must have an activity type" do
    expect(FactoryGirl.build(:role, :role => nil)).to be_invalid
  end
  
  it "must not allow duplicate activity types" do
    expect(FactoryGirl.create(:role, :role => "Role")).to be_valid
    expect(FactoryGirl.build(:role, :role => "Role")).to be_invalid
  end
end
