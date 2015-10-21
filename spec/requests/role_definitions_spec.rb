require 'rails_helper'

RSpec.describe "RoleDefinitions", :type => :request do
  describe "GET /role_definitions" do
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
      it "can visit the index page" do
        visit role_definitions_path
        expect(current_path).to eq(role_definitions_path)
        expect(page).to have_http_status(200)
      end
      it "can enter a new role definition" do
        pf = FactoryGirl::create(:profile)
        rs = FactoryGirl::create(:resource, :resource_type => ResourceType.where(:resource_type => "Patient").first())
        
        visit role_definitions_path
        expect(page).to have_content("New Role definition")
        click_link ("New Role definition")
        expect(current_path).to eq(new_role_definition_path)
        
        expect(page).to have_content(:role_definition_profile_id)
        expect(page).to have_content(:role_definition_role_id)
        expect(page).to have_content(:role_definition_patient_resource_id)
        
        select pf.full_name, :from => :role_definition_profile_id
        select "Designated Representative", :from => :role_definition_role_id
        select rs.resource_label, :from => :role_definition_patient_resource_id
        
        click_button "Create Role definition"
        expect(page).to have_content "Role definition was successfully created"
      end
      it "can edit and existing role definition" do
        rd = FactoryGirl::create(:role_definition)
        pr = FactoryGirl::create(:resource, :resource_type => ResourceType.where(:resource_type => "Patient").first())
        pf = FactoryGirl::create(:profile)
        rl = FactoryGirl::create(:role)
        
        visit role_definition_path(rd)
        expect(page).to have_content("Editing role_definition")
        expect(page).to have_content(:role_definition_profile_id)
        expect(page).to have_content(:role_definition_role_id)
        expect(page).to have_content(:role_definition_patient_resource_id)
        
        select pf.full_name, :from => :role_definition_profile_id
        select rl.role, :from => :role_definition_role_id
        select pr.resource_label, :from => :role_definition_patient_resource_id
        
        click_button "Update Role definition"
        expect(page).to have_content "Role definition was successfully updated"
      end
    end
  end
end
