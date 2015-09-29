require 'rails_helper'

RSpec.describe "ActivityUpdates", :type => :request do
  describe "GET /activity_updates" do
    it "works! (now write some real specs)" do
      get activity_updates_path
      expect(response).to have_http_status(200)
    end
  end
end
