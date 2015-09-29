require 'rails_helper'

RSpec.describe "UpdateActions", :type => :request do
  describe "GET /update_actions" do
    it "works! (now write some real specs)" do
      get update_actions_path
      expect(response).to have_http_status(200)
    end
  end
end
