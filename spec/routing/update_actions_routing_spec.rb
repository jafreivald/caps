require "rails_helper"

RSpec.describe UpdateActionsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/update_actions").to route_to("update_actions#index")
    end

    it "routes to #new" do
      expect(:get => "/update_actions/new").to route_to("update_actions#new")
    end

    it "routes to #show" do
      expect(:get => "/update_actions/1").to route_to("update_actions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/update_actions/1/edit").to route_to("update_actions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/update_actions").to route_to("update_actions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/update_actions/1").to route_to("update_actions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/update_actions/1").to route_to("update_actions#destroy", :id => "1")
    end

  end
end
