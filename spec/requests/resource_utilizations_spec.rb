require 'rails_helper'

RSpec.describe "ResourceUtilizations", :type => :request do
  describe "GET /resource_utilizations" do
    it "works! (now write some real specs)" do
      get resource_utilizations_path
      expect(response).to have_http_status(200)
    end
  end
end
