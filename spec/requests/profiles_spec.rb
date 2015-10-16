require 'rails_helper'

RSpec.describe "Profile management:", :type => :request do
  describe "The home page" do
    it "has a sign-up button that redirects to the signup page" do
      visit root_url
      click_link "Sign Up"
      expect(current_path).to eq(signup_path)
    end
    it "has a log in link that redirects you to the login page" do
      visit root_url
      click_link "Log In"
      expect(current_path).to eq(login_path)
    end
  end
  describe "The Signup page" do
    it "allows the user to sign up for the service and redirect to the root url" do
      visit signup_path
      fill_in "First name", :with => "John"
      fill_in "Last name", :with => "Doe"
      fill_in "Email", :with => "jd@anonymous.peeps"
      fill_in "Userid", :with => "jd1234"
      fill_in "Password", :with => "1234"
      fill_in "Password confirmation", :with => "1234"
      click_button "Create Profile"
      expect(current_path).to eq("/")
      expect(page).to have_content("Profile was successfully created")
    end
  end
end
