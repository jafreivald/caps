require 'rails_helper'

RSpec.describe "Password Reset", :type => :request do
  let(:profile) { FactoryGirl.create(:profile) }

  it "emails user when requesting a password reset" do
    visit login_path
    click_link "password"
    fill_in "Email", :with => profile.email
    click_button "Reset Password"
    
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Email sent")
    
    expect(last_email.to).to include(profile.email)
  end

  it "does not email a user when requesting a password reset from an invalid email address" do
    visit login_path
    click_link "password"
    fill_in "Email", :with => "nobody@nowhere.foo"
    click_button "Reset Password"
    
    expect(current_path).to eq(root_path)
    expect(page).to have_content("not a valid address")
    
    expect(last_email).to be(nil)
  end
  
  it "updates the profile password when confirmation matches" do
    p = FactoryGirl.create(:profile, :password_reset_token => "atoken", :password_reset_sent_at => 1.hour.ago)
    visit new_password_path(:password_reset_token => p.password_reset_token)
    expect(current_path).to eq(new_password_path)
    fill_in "Password", :with => "anewpassword"
    fill_in "Password confirmation", :with => "anewpassword"
    click_button "Update Password"
    expect(current_path).to eq(edit_profile_path(p))
    expect(page).to have_content("Profile was successfully updated.")
  end
  
  it "reports when a password token has expired" do
    p = FactoryGirl.create(:profile, :password_reset_token => "atoken", :password_reset_sent_at => 5.hour.ago)
    visit new_password_path(:password_reset_token => p.password_reset_token)
    
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Password reset token has expired")
  end
  
  it "reports a password token as expired when the token is not valid" do
    visit new_password_path(:password_reset_token => "aninvalidtoken")

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Password reset token has expired")
  end
  
end
