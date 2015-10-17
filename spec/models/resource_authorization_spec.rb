require 'rails_helper'

RSpec.describe ResourceAuthorization, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:resource_authorization)).to be_valid
  end
  
  it "must have an role_definition" do
    expect(FactoryGirl.build(:resource_authorization, :role_definition => nil)).to be_invalid
  end
  
  it "must have a resource" do
    expect(FactoryGirl.build(:resource_authorization, :resource => nil)).to be_invalid
  end
end
