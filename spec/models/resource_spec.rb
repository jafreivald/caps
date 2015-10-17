require 'rails_helper'

RSpec.describe Resource, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:resource)).to be_valid
  end
  
  it "must have an resource type" do
    expect(FactoryGirl.build(:resource, :resource_type => nil)).to be_invalid
  end
  
  it "must have a FHIR base URL" do
    expect(FactoryGirl.build(:resource, :fhir_base_url => nil)).to be_invalid
  end

  it "must have a FHIR ID" do
    expect(FactoryGirl.build(:resource, :fhir_resource_id => nil)).to be_invalid
  end

  it "must maintain uniqueness for a combination of FHIR URL, Resource Type and FHIR ID." do
    furl = FactoryGirl.create(:fhir_base_url)
    rt = FactoryGirl.create(:resource_type)
    expect(FactoryGirl.create(:resource, :resource_type => rt, :fhir_base_url => furl, :fhir_resource_id => 1)).to be_valid
    expect(FactoryGirl.build(:resource, :resource_type => rt, :fhir_base_url => furl, :fhir_resource_id => 1)).to be_invalid
  end
  describe "Resource fetching and parsing functions" do
    pending "add some examples to (or delete) #{__FILE__}"
  end
end
