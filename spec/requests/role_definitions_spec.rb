require 'rails_helper'

RSpec.describe "RoleDefinitions", :type => :request do
  describe "GET /role_definitions" do
    it "works! (now write some real specs)" do
      get role_definitions_path
      expect(response).to have_http_status(200)
    end
  end
end
