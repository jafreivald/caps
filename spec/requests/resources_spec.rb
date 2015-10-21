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
      
      it "provides a nice error message if unable to reach the resource on creating and importing a patient" do
        visit new_resource_path
        expect(current_path).to eq(new_resource_path)
        expect(page).to have_http_status(200)
        select "http://localhost/", :from => "resource_fhir_base_url_id"
        select "Patient", :from => "resource_resource_type_id"
        patient_id = Faker::Number.number(2)
        fill_in "Fhir resource", :with => patient_id.to_s
        click_button "Create Resource"
        expect(page).to have_content("Unable to reach FHIR resource. Please check the URL and resource accessibility.")
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
        url = page.current_path
        visit resources_path
        expect(current_path).to eq(resources_path)
        find(:xpath, "//a[@href='#{url}']").click
        expect(current_path).to eq(url)
      end
      
      it "can add a resource with a non-patient resource type" do
        rt = FactoryGirl.create(:resource_type)
        visit new_resource_path
        expect(current_path).to eq(new_resource_path)
        expect(page).to have_http_status(200)
        select "http://polaris.i3l.gatech.edu:8080/gt-fhir-webapp/base/", :from => "resource_fhir_base_url_id"
        select rt.resource_type, :from => "resource_resource_type_id"
        patient_id = Faker::Number.number(2)
        fill_in "Fhir resource", :with => patient_id.to_s
        click_button "Create Resource"
        expect(page).to have_content("Resource was successfully created.")
      end
      
      it "can select the resource from the index after it is created." do
        rt = FactoryGirl.create(:resource_type)
        visit new_resource_path
        expect(current_path).to eq(new_resource_path)
        expect(page).to have_http_status(200)
        select "http://polaris.i3l.gatech.edu:8080/gt-fhir-webapp/base/", :from => "resource_fhir_base_url_id"
        select rt.resource_type, :from => "resource_resource_type_id"
        patient_id = Faker::Number.number(2)
        fill_in "Fhir resource", :with => patient_id.to_s
        click_button "Create Resource"
        expect(page).to have_content("Resource was successfully created.")
        url = page.current_path
        visit resources_path
        expect(current_path).to eq(resources_path)
        find(:xpath, "//a[@href='#{url}']").click
        expect(current_path).to eq(url)
      end
        
      it "must import Patient resource data" do
        furl = FhirBaseUrl.first()
        rt = ResourceType.where(:resource_type => "Patient").first()
        rs = FactoryGirl.create(:resource, :fhir_base_url => furl, :resource_type => rt, :fhir_resource_id => Faker::Number.number(2))
        rl = Role.find_by_role("Resource Creator")
        rd = FactoryGirl.create(:role_definition, :profile => profile, :role => rl)
        ra = FactoryGirl.create(:resource_authorization, :role_definition => rd, :resource => rs)
        
        visit edit_resource_path(rs)
        expect(current_path).to eq(edit_resource_path(rs))
        expect(page).to have_http_status(200)
        click_link("Import")
        expect(page).to have_content("Resource successfully imported.")
      end
  
      it "must import Condition resource data" do
        furl = FhirBaseUrl.first()
        rt = ResourceType.where(:resource_type => "Condition").first()
        rs = FactoryGirl.create(:resource, :fhir_base_url => furl, :resource_type => rt, :fhir_resource_id => Faker::Number.number(2))
        rl = Role.find_by_role("Resource Creator")
        rd = FactoryGirl.create(:role_definition, :profile => profile, :role => rl)
        ra = FactoryGirl.create(:resource_authorization, :role_definition => rd, :resource => rs)
        
        visit edit_resource_path(rs)
        expect(current_path).to eq(edit_resource_path(rs))
        expect(page).to have_http_status(200)
        click_link("Import")
        expect(page).to have_content("Resource successfully imported.")      end
  
      it "must import Encounter resource data" do
        furl = FhirBaseUrl.first()
        rt = ResourceType.where(:resource_type => "Encounter").first()
        rs = FactoryGirl.create(:resource, :fhir_base_url => furl, :resource_type => rt, :fhir_resource_id => Faker::Number.number(2))
        rl = Role.find_by_role("Resource Creator")
        rd = FactoryGirl.create(:role_definition, :profile => profile, :role => rl)
        ra = FactoryGirl.create(:resource_authorization, :role_definition => rd, :resource => rs)
        
        visit edit_resource_path(rs)
        expect(current_path).to eq(edit_resource_path(rs))
        expect(page).to have_http_status(200)
        click_link("Import")
        expect(page).to have_content("Resource successfully imported.")
      end
  
      it "must import Medication resource data" do
        furl = FhirBaseUrl.first()
        rt = ResourceType.where(:resource_type => "Medication").first()
        rs = FactoryGirl.create(:resource, :fhir_base_url => furl, :resource_type => rt, :fhir_resource_id => 528264)
        rl = Role.find_by_role("Resource Creator")
        rd = FactoryGirl.create(:role_definition, :profile => profile, :role => rl)
        ra = FactoryGirl.create(:resource_authorization, :role_definition => rd, :resource => rs)
        
        visit edit_resource_path(rs)
        expect(current_path).to eq(edit_resource_path(rs))
        expect(page).to have_http_status(200)
        click_link("Import")
        expect(page).to have_content("Resource successfully imported.")
      end
  
      it "must import MedicationDispense resource data" do
        furl = FhirBaseUrl.first()
        rt = ResourceType.where(:resource_type => "MedicationDispense").first()
        rs = FactoryGirl.create(:resource, :fhir_base_url => furl, :resource_type => rt, :fhir_resource_id => 786)
        rl = Role.find_by_role("Resource Creator")
        rd = FactoryGirl.create(:role_definition, :profile => profile, :role => rl)
        ra = FactoryGirl.create(:resource_authorization, :role_definition => rd, :resource => rs)
        
        visit edit_resource_path(rs)
        expect(current_path).to eq(edit_resource_path(rs))
        expect(page).to have_http_status(200)
        click_link("Import")
        expect(page).to have_content("Resource successfully imported.")
      end
  
      it "must import MedicationPrescription resource data" do
        furl = FhirBaseUrl.first()
        rt = ResourceType.where(:resource_type => "MedicationPrescription").first()
        rs = FactoryGirl.create(:resource, :fhir_base_url => furl, :resource_type => rt, :fhir_resource_id => Faker::Number.number(2))
        rl = Role.find_by_role("Resource Creator")
        rd = FactoryGirl.create(:role_definition, :profile => profile, :role => rl)
        ra = FactoryGirl.create(:resource_authorization, :role_definition => rd, :resource => rs)
        
        visit edit_resource_path(rs)
        expect(current_path).to eq(edit_resource_path(rs))
        expect(page).to have_http_status(200)
        click_link("Import")
        expect(page).to have_content("Resource successfully imported.")
      end
  
      it "must import Observation resource data" do
        furl = FhirBaseUrl.first()
        rt = ResourceType.where(:resource_type => "Observation").first()
        rs = FactoryGirl.create(:resource, :fhir_base_url => furl, :resource_type => rt, :fhir_resource_id => Faker::Number.number(2))
        rl = Role.find_by_role("Resource Creator")
        rd = FactoryGirl.create(:role_definition, :profile => profile, :role => rl)
        ra = FactoryGirl.create(:resource_authorization, :role_definition => rd, :resource => rs)
        
        visit edit_resource_path(rs)
        expect(current_path).to eq(edit_resource_path(rs))
        expect(page).to have_http_status(200)
        click_link("Import")
        expect(page).to have_content("Resource successfully imported.")
      end
      pending("Other resource operations")
    end
  end
end