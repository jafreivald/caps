require 'rails_helper'

RSpec.describe "ResourceAuthorizations", :type => :request do
  describe "GET /resource_authorizations" do
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
        visit resource_authorizations_path
        expect(current_path).to eq(resource_authorizations_path)
        expect(page).to have_http_status(200)
      end
      it "can enter a new resource authorization" do
        rd = FactoryGirl::create(:role_definition)
        rs = FactoryGirl::create(:resource)
        
        visit resource_authorizations_path
        expect(page).to have_content("New Resource authorization")
        click_link ("New Resource authorization")
        expect(current_path).to eq(new_resource_authorization_path)
        
        expect(page).to have_content(:resource_authorization_role_definition_id)
        expect(page).to have_content(:resource_authorization_resource_id)
        
        select rd.role_information, :from => :resource_authorization_role_definition_id
        select rs.resource_label, :from => :resource_authorization_resource_id
        
        click_button "Create Resource authorization"
        expect(page).to have_content "Resource authorization was successfully created"
      end
      it "can edit and existing resource authorization" do
        rd = FactoryGirl::create(:resource_authorization)
        rs = FactoryGirl::create(:resource)
        rl = FactoryGirl::create(:role_definition)
        
        visit resource_authorization_path(rd)
        expect(page).to have_content("Editing resource_authorization")
        expect(page).to have_content(:resource_authorization_role_definition_id)
        expect(page).to have_content(:resource_authorization_resource_id)
        
        select rl.role_information, :from => :resource_authorization_role_definition_id
        select rs.resource_label, :from => :resource_authorization_resource_id
        
        click_button "Update Resource authorization"
        expect(page).to have_content "Resource authorization was successfully updated"
      end
    end
  end
end
