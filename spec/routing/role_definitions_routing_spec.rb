require "rails_helper"

RSpec.describe RoleDefinitionsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/role_definitions").to route_to("role_definitions#index")
    end

    it "routes to #new" do
      expect(:get => "/role_definitions/new").to route_to("role_definitions#new")
    end

    it "routes to #show" do
      expect(:get => "/role_definitions/1").to route_to("role_definitions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/role_definitions/1/edit").to route_to("role_definitions#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/role_definitions").to route_to("role_definitions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/role_definitions/1").to route_to("role_definitions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/role_definitions/1").to route_to("role_definitions#destroy", :id => "1")
    end

  end
end
