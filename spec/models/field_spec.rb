require 'rails_helper'

RSpec.describe Field, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:field)).to be_valid
  end
  
  it "must have a field_type" do
    expect(FactoryGirl.build(:field, :field_type => nil)).to be_invalid
  end
  
  it "must have a field_text" do
    expect(FactoryGirl.build(:field, :field_text => nil)).to be_invalid
  end
  
  it "must have a resource" do
    expect(FactoryGirl.build(:field, :resource => nil)).to be_invalid
  end
end
