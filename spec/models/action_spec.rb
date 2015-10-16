require 'rails_helper'

RSpec.describe Action, :type => :model do
  it "accepts an action when created" do
    expect(FactoryGirl.build(:action)).to be_valid
  end
  
  it "rejects an action when it is blank" do
    expect(FactoryGirl.build(:action, :action => nil)).to be_invalid
  end
end
