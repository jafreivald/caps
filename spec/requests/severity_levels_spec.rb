require 'rails_helper'

RSpec.describe "SeverityLevels", :type => :request do
  describe "GET /severity_levels" do
    it "works! (now write some real specs)" do
      get severity_levels_path
      expect(response).to have_http_status(200)
    end
  end
end
