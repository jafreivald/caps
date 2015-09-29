require 'rails_helper'

RSpec.describe "fhir_base_urls/edit", :type => :view do
  before(:each) do
    @fhir_base_url = assign(:fhir_base_url, FhirBaseUrl.create!(
      :fhir_base_url => "MyString"
    ))
  end

  it "renders the edit fhir_base_url form" do
    render

    assert_select "form[action=?][method=?]", fhir_base_url_path(@fhir_base_url), "post" do

      assert_select "input#fhir_base_url_fhir_base_url[name=?]", "fhir_base_url[fhir_base_url]"
    end
  end
end
