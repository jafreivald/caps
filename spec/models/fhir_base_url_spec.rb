require 'rails_helper'

RSpec.describe FhirBaseUrl, :type => :model do
  it "has a valid factory" do
    expect(FactoryGirl.build(:fhir_base_url)).to be_valid
  end
  
  it "must have an activity type" do
    expect(FactoryGirl.build(:fhir_base_url, :fhir_base_url => nil)).to be_invalid
  end
  
  it "must not allow duplicate activity types" do
    expect(FactoryGirl.create(:fhir_base_url, :fhir_base_url => "https://www.fhirstuff.com/my/fhir/db")).to be_valid
    expect(FactoryGirl.build(:fhir_base_url, :fhir_base_url => "https://www.fhirstuff.com/my/fhir/db")).to be_invalid
  end
end
