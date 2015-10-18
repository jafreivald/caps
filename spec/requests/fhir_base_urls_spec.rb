require 'rails_helper'

RSpec.describe "FhirBaseUrls", :type => :request do
  describe "GET /fhir_base_urls" do
    describe "a profile that is not logged in" do
      it 'redirects to login' do
        visit resource_types_path
        expect(current_path).to eq(login_path)
        expect(page).to have_http_status(200)      
      end
    end
    describe "a logged in user" do
      let (:profile ) {FactoryGirl.create(:profile, :password => 'pw', :password_confirmation => 'pw')}
      before {
        visit login_path
        fill_in "Userid", :with => profile.userid
        fill_in "Password", :with => 'pw'
        click_button "Log In"
      }
      it "can visit the page" do
        visit fhir_base_urls_path
        expect(current_path).to eq(fhir_base_urls_path)
        expect(page).to have_http_status(200)
      end
      it "must gracefully recover from a delete attempt when there are resources of this type" do
        url = FactoryGirl.create(:fhir_base_url)
        FactoryGirl.create(:resource, :fhir_base_url => url)
        visit fhir_base_urls_path
        find(:xpath, "//a[@href='/fhir_base_urls/#{url.id}']").click
        expect(page).to have_content("Could not delete the URL because there are resources assigned to it.")
      end
    end
  end
end