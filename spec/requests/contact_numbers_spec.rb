require 'rails_helper'

RSpec.describe "ContactNumbers", :type => :request do
  describe "GET /contact_numbers" do
    it "works! (now write some real specs)" do
      get contact_numbers_path
      expect(response).to have_http_status(200)
    end
  end
end
