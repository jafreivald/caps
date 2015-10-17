require 'rails_helper'

RSpec.describe UpdateAction, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:update_action)).to be_valid
  end
  
  it "must have an update action" do
    expect(FactoryGirl.build(:update_action, :update_action => nil)).to be_invalid
  end
  
  it "must not allow duplicate update actions" do
    expect(FactoryGirl.create(:update_action, :update_action => "UpdateAction")).to be_valid
    expect(FactoryGirl.build(:update_action, :update_action => "UpdateAction")).to be_invalid
  end
end