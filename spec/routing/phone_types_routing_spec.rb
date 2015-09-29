require "rails_helper"

RSpec.describe PhoneTypesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/phone_types").to route_to("phone_types#index")
    end

    it "routes to #new" do
      expect(:get => "/phone_types/new").to route_to("phone_types#new")
    end

    it "routes to #show" do
      expect(:get => "/phone_types/1").to route_to("phone_types#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/phone_types/1/edit").to route_to("phone_types#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/phone_types").to route_to("phone_types#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/phone_types/1").to route_to("phone_types#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/phone_types/1").to route_to("phone_types#destroy", :id => "1")
    end

  end
end
