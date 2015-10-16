require 'rails_helper'

RSpec.describe ContactNumber, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:contact_number)).to be_valid
  end
  
  it "must have a contact method" do
    expect(FactoryGirl.build(:contact_number, :contact_method => nil)).to be_invalid
  end
  
  it "must have a profile" do
    expect(FactoryGirl.build(:contact_number, :profile => nil)).to be_invalid
  end
  
  it "must have a phone number" do
    expect(FactoryGirl.build(:contact_number, :phone_number => nil)).to be_invalid
  end
  
  it "must have the preferred flag default to true" do
    cn = FactoryGirl.create(:contact_number, :preferred => nil)
    cn.reload
    expect(cn.preferred).to eq(true)
  end
  
  it "will accept a preferred flag set to false" do
    cn = FactoryGirl.create(:contact_number, :preferred => false)
    cn.reload
    expect(cn.preferred).to eq(false)
  end
end
