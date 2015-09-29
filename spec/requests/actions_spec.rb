require 'rails_helper'

RSpec.describe "Actions", :type => :request do
  describe "GET /actions" do
    it "works! (now write some real specs)" do
      get actions_path
      expect(response).to have_http_status(200)
    end
  end
end
