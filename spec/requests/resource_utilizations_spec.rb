require 'rails_helper'

RSpec.describe "ResourceUtilizations", :type => :request do
  describe "GET /resource_utilizations" do
    it "works! (now write some real specs)" do
     #create a user and log them in
      p = FactoryGirl.create(:profile, :password => 'pw', :password_confirmation => 'pw')
      expect(p.persisted?).to eq(true)
      visit login_path
      fill_in "Userid", :with => p.userid
      fill_in "Password", :with => 'pw'
      click_button "Log In"
      expect(page).to have_content("Log in successful")

      visit resource_utilizations_path
      expect(current_path).to eq(resource_utilizations_path)
      expect(page).to have_http_status(200)
    end
  end
end
