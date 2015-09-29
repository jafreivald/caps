require "rails_helper"

RSpec.describe SeverityLevelsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/severity_levels").to route_to("severity_levels#index")
    end

    it "routes to #new" do
      expect(:get => "/severity_levels/new").to route_to("severity_levels#new")
    end

    it "routes to #show" do
      expect(:get => "/severity_levels/1").to route_to("severity_levels#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/severity_levels/1/edit").to route_to("severity_levels#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/severity_levels").to route_to("severity_levels#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/severity_levels/1").to route_to("severity_levels#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/severity_levels/1").to route_to("severity_levels#destroy", :id => "1")
    end

  end
end
