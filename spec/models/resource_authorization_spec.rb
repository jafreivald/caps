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
  
  it "must get deleted when the resource is deleted" do
    ra = FactoryGirl.create(:resource_authorization)
    rs = ra.resource
    rs.destroy
    expect(rs.persisted?).to be(false)
    expect(ResourceAuthorization.exists?(ra)).to be(false)    
  end
end
