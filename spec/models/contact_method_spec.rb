require 'rails_helper'

RSpec.describe ContactMethod, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:contact_method)).to be_valid
  end
  
  it "must have an activity type" do
    expect(FactoryGirl.build(:contact_method, :contact_method => nil)).to be_invalid
  end
  
  it "must not allow duplicate activity types" do
    expect(FactoryGirl.create(:contact_method, :contact_method => "This Method")).to be_valid
    expect(FactoryGirl.build(:contact_method, :contact_method => "This Method")).to be_invalid
  end
end
