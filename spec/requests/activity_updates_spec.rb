require 'rails_helper'

RSpec.describe "ActivityUpdates", :type => :request do
  describe "GET /activity_updates" do
    describe "a profile that is not logged in" do
      it 'redirects to login' do
        visit resources_path
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
        visit activity_updates_path
        expect(current_path).to eq(activity_updates_path)
        expect(page).to have_http_status(200)
      end
    end
  end
end
