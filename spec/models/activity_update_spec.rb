require 'rails_helper'

RSpec.describe ActivityUpdate, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:activity_update)).to be_valid
  end
  
  it "must have an activity" do
    expect(FactoryGirl.build(:activity_update, :activity => nil)).to be_invalid
  end
  
  it "must have a profile" do
    expect(FactoryGirl.build(:activity_update, :profile => nil)).to be_invalid
  end
  
  it "must have an action" do
    expect(FactoryGirl.build(:activity_update, :action => nil)).to be_invalid
  end
  
  it "must have a narrative" do
    expect(FactoryGirl.build(:activity_update, :narrative => nil)).to be_invalid
  end
end
