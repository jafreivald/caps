require 'rails_helper'

RSpec.describe Profile, :type => :model do
  let(:profile) { FactoryGirl.create(:profile) }
  
  it "Factory creates a valid user" do
    expect(profile).to be_valid
    profile.save!
  end
  
  it "Requires First Name, Last Name, User ID, Email, Password and a matching Password Confirmation" do
    expect(FactoryGirl.build(:profile, :first_name => nil)).to be_invalid
    expect(FactoryGirl.build(:profile, :last_name => nil)).to be_invalid
    expect(FactoryGirl.build(:profile, :email => nil)).to be_invalid
    expect(FactoryGirl.build(:profile, :userid => nil)).to be_invalid
    expect(FactoryGirl.build(:profile, :password => nil)).to be_invalid
    expect(FactoryGirl.build(:profile, :password_confirmation => nil)).to be_invalid
    expect(FactoryGirl.build(:profile, :password => "ThisPassword", :password_confirmation => "ThatPassword")).to be_invalid
  end
  
  describe "#send_password_reset" do
    
    it "generates a unique password_reset_token each time" do
      profile.send_password_reset
      last_token = profile.password_reset_token
      profile.send_password_reset
      expect(profile.password_reset_token).not_to eq(last_token)
    end
  
    it "saves the time the password reset was sent" do
      profile.send_password_reset
      expect(profile.reload.password_reset_sent_at).to be_present
    end
  
    it "delivers email to the profile" do
      profile.send_password_reset
      expect(last_email.to).to include(profile.email)
    end
  end
end
