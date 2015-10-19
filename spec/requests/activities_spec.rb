require 'rails_helper'

RSpec.describe "Activities", :type => :request do
  describe "GET /activities" do
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
        visit activities_path
        expect(current_path).to eq(activities_path)
        expect(page).to have_http_status(200)
      end
      it "can create an activity" do
        visit new_activity_path
        select "Fill Prescription", :from => "activity_activity_type_id"
        fill_in "Base time", :with => 1.hour.from_now
        select "Low", :from => "activity_severity_level_id"
        click_button "Create Activity"
        expect(page).to have_content("Activity was successfully created.")
      end
    end
  end
end
