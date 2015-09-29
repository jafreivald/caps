require 'rails_helper'

RSpec.describe "fhir_base_urls/show", :type => :view do
  before(:each) do
    @fhir_base_url = assign(:fhir_base_url, FhirBaseUrl.create!(
      :fhir_base_url => "Fhir Base Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Fhir Base Url/)
  end
end
