require 'rails_helper'

RSpec.describe "ResourceTypes", :type => :request do
  describe "GET /resource_types" do
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
        visit resource_types_path
        expect(current_path).to eq(resource_types_path)
        expect(page).to have_http_status(200)
      end
      it "must gracefully recover from a delete attempt when there are resources of this type" do
        rt = FactoryGirl.create(:resource_type)
        FactoryGirl.create(:resource, :resource_type => rt)
        visit resource_types_path
        find(:xpath, "//a[@href='/resource_types/#{rt.id}']").click
        expect(page).to have_content("Could not delete the resource type because there are resources assigned to this type.")
      end
    end
  end
end
