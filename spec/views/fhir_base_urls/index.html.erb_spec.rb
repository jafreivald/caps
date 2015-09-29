require 'rails_helper'

RSpec.describe "fhir_base_urls/index", :type => :view do
  before(:each) do
    assign(:fhir_base_urls, [
      FhirBaseUrl.create!(
        :fhir_base_url => "Fhir Base Url"
      ),
      FhirBaseUrl.create!(
        :fhir_base_url => "Fhir Base Url"
      )
    ])
  end

  it "renders a list of fhir_base_urls" do
    render
    assert_select "tr>td", :text => "Fhir Base Url".to_s, :count => 2
  end
end
