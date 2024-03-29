require "rails_helper"

RSpec.describe FhirBaseUrlsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/fhir_base_urls").to route_to("fhir_base_urls#index")
    end

    it "routes to #new" do
      expect(:get => "/fhir_base_urls/new").to route_to("fhir_base_urls#new")
    end

    it "routes to #show" do
      expect(:get => "/fhir_base_urls/1").to route_to("fhir_base_urls#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/fhir_base_urls/1/edit").to route_to("fhir_base_urls#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/fhir_base_urls").to route_to("fhir_base_urls#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/fhir_base_urls/1").to route_to("fhir_base_urls#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/fhir_base_urls/1").to route_to("fhir_base_urls#destroy", :id => "1")
    end

  end
end
