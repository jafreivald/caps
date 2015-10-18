require 'rails_helper'

RSpec.describe "Resources", :type => :request do
  describe "GET /resources" do
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
      it "can visit the index page and click a new resource link that takes them to a new resource" do
        visit resources_path
        expect(current_path).to eq(resources_path)
        expect(page).to have_http_status(200)
        click_link "New Resource"
        expect(current_path).to eq(new_resource_path)
        expect(page).to have_http_status(200)
      end
      it "can add a Patient" do
        visit new_resource_path
        expect(current_path).to eq(new_resource_path)
        expect(page).to have_http_status(200)
        select "http://polaris.i3l.gatech.edu:8080/gt-fhir-webapp/base/", :from => "resource_fhir_base_url_id"
        select "Patient", :from => "resource_resource_type_id"
        patient_id = Faker::Number.number(2)
        fill_in "Fhir resource", :with => patient_id.to_s
        click_button "Create Resource"
        expect(page).to have_content("Resource was successfully created.")
      end
      it "can select the patient from the index after it is loaded." do
        visit new_resource_path
        expect(current_path).to eq(new_resource_path)
        expect(page).to have_http_status(200)
        select "http://polaris.i3l.gatech.edu:8080/gt-fhir-webapp/base/", :from => "resource_fhir_base_url_id"
        select "Patient", :from => "resource_resource_type_id"
        patient_id = Faker::Number.number(2)
        fill_in "Fhir resource", :with => patient_id.to_s
        click_button "Create Resource"
        expect(page).to have_content("Resource was successfully created.")
        visit resources_path
        expect(current_path).to eq(resources_path)
        click_link "Edit"
      end
    end
  end
end