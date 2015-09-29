require "rails_helper"

RSpec.describe ActivityUpdatesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/activity_updates").to route_to("activity_updates#index")
    end

    it "routes to #new" do
      expect(:get => "/activity_updates/new").to route_to("activity_updates#new")
    end

    it "routes to #show" do
      expect(:get => "/activity_updates/1").to route_to("activity_updates#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/activity_updates/1/edit").to route_to("activity_updates#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/activity_updates").to route_to("activity_updates#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/activity_updates/1").to route_to("activity_updates#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/activity_updates/1").to route_to("activity_updates#destroy", :id => "1")
    end

  end
end
