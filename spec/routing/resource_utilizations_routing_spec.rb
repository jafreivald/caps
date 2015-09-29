require "rails_helper"

RSpec.describe ResourceUtilizationsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/resource_utilizations").to route_to("resource_utilizations#index")
    end

    it "routes to #new" do
      expect(:get => "/resource_utilizations/new").to route_to("resource_utilizations#new")
    end

    it "routes to #show" do
      expect(:get => "/resource_utilizations/1").to route_to("resource_utilizations#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/resource_utilizations/1/edit").to route_to("resource_utilizations#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/resource_utilizations").to route_to("resource_utilizations#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/resource_utilizations/1").to route_to("resource_utilizations#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/resource_utilizations/1").to route_to("resource_utilizations#destroy", :id => "1")
    end

  end
end
