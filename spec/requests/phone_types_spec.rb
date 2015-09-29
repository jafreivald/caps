require 'rails_helper'

RSpec.describe "PhoneTypes", :type => :request do
  describe "GET /phone_types" do
    it "works! (now write some real specs)" do
      get phone_types_path
      expect(response).to have_http_status(200)
    end
  end
end
