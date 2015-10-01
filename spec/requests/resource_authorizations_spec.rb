require 'rails_helper'

RSpec.describe "ResourceAuthorizations", :type => :request do
  describe "GET /resource_authorizations" do
    it "works! (now write some real specs)" do
      get resource_authorizations_path
      expect(response).to have_http_status(200)
    end
  end
end
