require 'rails_helper'

RSpec.describe "fhir_base_urls/new", :type => :view do
  before(:each) do
    assign(:fhir_base_url, FhirBaseUrl.new(
      :fhir_base_url => "MyString"
    ))
  end

  it "renders new fhir_base_url form" do
    render

    assert_select "form[action=?][method=?]", fhir_base_urls_path, "post" do

      assert_select "input#fhir_base_url_fhir_base_url[name=?]", "fhir_base_url[fhir_base_url]"
    end
  end
end
