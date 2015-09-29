require "rails_helper"

RSpec.describe ContactNumbersController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/contact_numbers").to route_to("contact_numbers#index")
    end

    it "routes to #new" do
      expect(:get => "/contact_numbers/new").to route_to("contact_numbers#new")
    end

    it "routes to #show" do
      expect(:get => "/contact_numbers/1").to route_to("contact_numbers#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/contact_numbers/1/edit").to route_to("contact_numbers#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/contact_numbers").to route_to("contact_numbers#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/contact_numbers/1").to route_to("contact_numbers#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/contact_numbers/1").to route_to("contact_numbers#destroy", :id => "1")
    end

  end
end
