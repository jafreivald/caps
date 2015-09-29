require 'rails_helper'

RSpec.describe "PhoneProviders", :type => :request do
  describe "GET /phone_providers" do
    it "works! (now write some real specs)" do
      get phone_providers_path
      expect(response).to have_http_status(200)
    end
  end
end
