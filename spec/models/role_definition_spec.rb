require 'rails_helper'

RSpec.describe RoleDefinition, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:role_definition)).to be_valid
  end
 
  it "must have an role_definition" do
    expect(FactoryGirl.build(:role_definition, :role => nil)).to be_invalid
  end
  
  it "must have a resource" do
    expect(FactoryGirl.build(:role_definition, :profile => nil)).to be_invalid
  end

  it "must have a patient resource" do
    expect(FactoryGirl.build(:role_definition, :patient_resource => nil)).to be_invalid
  end
  
  it "must get cascade deleted when the patient resource is destroyed" do
    rd = FactoryGirl.create(:role_definition)
    rs = rd.patient_resource
    rs.destroy
    expect(rd.patient_resource.persisted?).to be(false)
    expect(RoleDefinition.exists?(rd)).to be(false)
  end
  
  
end
