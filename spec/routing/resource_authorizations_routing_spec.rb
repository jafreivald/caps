require "rails_helper"

RSpec.describe ResourceAuthorizationsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/resource_authorizations").to route_to("resource_authorizations#index")
    end

    it "routes to #new" do
      expect(:get => "/resource_authorizations/new").to route_to("resource_authorizations#new")
    end

    it "routes to #show" do
      expect(:get => "/resource_authorizations/1").to route_to("resource_authorizations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/resource_authorizations/1/edit").to route_to("resource_authorizations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/resource_authorizations").to route_to("resource_authorizations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/resource_authorizations/1").to route_to("resource_authorizations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/resource_authorizations/1").to route_to("resource_authorizations#destroy", :id => "1")
    end

  end
end
