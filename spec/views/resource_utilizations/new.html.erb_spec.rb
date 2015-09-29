require 'rails_helper'

RSpec.describe "resource_utilizations/new", :type => :view do
  before(:each) do
    assign(:resource_utilization, ResourceUtilization.new(
      :resource => nil,
      :fhir_base_url => nil
    ))
  end

  it "renders new resource_utilization form" do
    render

    assert_select "form[action=?][method=?]", resource_utilizations_path, "post" do

      assert_select "input#resource_utilization_resource[name=?]", "resource_utilization[resource]"

      assert_select "input#resource_utilization_fhir_base_url[name=?]", "resource_utilization[fhir_base_url]"
    end
  end
end
