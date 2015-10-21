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
  
  it "must not allow duplicate roles to be entered for the same profile and patient" do
    rl = FactoryGirl.create(:role)
    pt = FactoryGirl.create(:resource, :resource_type => ResourceType.where(:resource_type => "Patient").first())
    pf = FactoryGirl.create(:profile)
    
    expect(FactoryGirl.create(:role_definition, :role => rl, :patient_resource => pt, :profile => pf)).to be_valid
    expect(FactoryGirl.build(:role_definition, :role => rl, :patient_resource => pt, :profile => pf)).to be_invalid
  end
  
  it "validates that the resource assigned to the patient_resource_id has a resource_type of Patient" do
    rl = FactoryGirl.create(:role)
    pt = FactoryGirl.create(:resource, :resource_type => ResourceType.where(:resource_type => "Patient").first())
    npt = FactoryGirl.create(:resource)
    pf = FactoryGirl.create(:profile)
    expect(FactoryGirl.build(:role_definition, :role => rl, :patient_resource => pt, :profile => pf)).to be_valid
    expect(FactoryGirl.build(:role_definition, :role => rl, :patient_resource => npt, :profile => pf)).to be_invalid
  end
  
end
