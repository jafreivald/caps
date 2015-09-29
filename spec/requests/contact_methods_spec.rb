require 'rails_helper'

RSpec.describe "ContactMethods", :type => :request do
  describe "GET /contact_methods" do
    it "works! (now write some real specs)" do
      get contact_methods_path
      expect(response).to have_http_status(200)
    end
  end
end
