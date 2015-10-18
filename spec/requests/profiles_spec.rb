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
    it "does not allow a blank session to edit a user" do
      p = FactoryGirl.create(:profile, :password => 'pw', :password_confirmation => 'pw')
      expect(p.persisted?).to eq(true)
      visit edit_profile_path(p)
      expect(current_path).to eq(login_path)
      expect(page).to have_content("Not Authorized")
    end
  end
  describe "The login page" do
    it "allows a current user to log in" do
      #create a user and log them in
      p = FactoryGirl.create(:profile, :password => 'pw', :password_confirmation => 'pw')
      expect(p.persisted?).to eq(true)
      visit login_path
      fill_in "Userid", :with => p.userid
      fill_in "Password", :with => 'pw'
      click_button "Log In"
    end
  end
  describe "The profile index page" do
    it "logs the user out when they delete their own profile" do
      #create a user and log them in
      p = FactoryGirl.create(:profile, :password => 'pw', :password_confirmation => 'pw')
      expect(p.persisted?).to eq(true)
      visit login_path
      fill_in "Userid", :with => p.userid
      fill_in "Password", :with => 'pw'
      click_button "Log In"
      expect(page).to have_content("Log in successful")
      
      #Delete this user's profile
      visit profiles_path
      expect(page).to have_content(p.email)
      #save_and_open_page
      my_row = find(:css, "tr##{p.id}")
      within my_row do
        click_link "Destroy"
      end
      #puts p.inspect
      expect(current_path).to eq(login_path)
      expect(page).to have_content("profile was successfully deleted")
    end
    it "does not redirect when the user deletes someone else's profile" do
      #create a user and log them in
      p = FactoryGirl.create(:profile, :password => 'pw', :password_confirmation => 'pw')
      p2 = FactoryGirl.create(:profile)
      expect(p.persisted?).to eq(true)
      visit login_path
      fill_in "Userid", :with => p.userid
      fill_in "Password", :with => 'pw'
      click_button "Log In"
      
      #Modify a different profile
      visit profiles_path
      expect(page).to have_content(p.email)
      #save_and_open_page
      my_row = find(:css, "tr##{p2.id}")
      within my_row do
        click_link "Destroy"
      end
      #puts p.inspect
      expect(current_path).to eq(profiles_path)
      expect(page).to have_content("profile was successfully deleted")
    end
  end
end
