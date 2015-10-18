require 'rails_helper'

RSpec.describe "FhirBaseUrls", :type => :request do
  describe "GET /fhir_base_urls" do
    it "works when logged in" do
     #create a user and log them in
      p = FactoryGirl.create(:profile, :password => 'pw', :password_confirmation => 'pw')
      expect(p.persisted?).to eq(true)
      visit login_path
      fill_in "Userid", :with => p.userid
      fill_in "Password", :with => 'pw'
      click_button "Log In"
      expect(page).to have_content("Log in successful")

      visit fhir_base_urls_path
      expect(current_path).to eq(fhir_base_urls_path)
      expect(page).to have_http_status(200)
    end
  end
end
