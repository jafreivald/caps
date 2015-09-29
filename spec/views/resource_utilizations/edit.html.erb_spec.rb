require 'rails_helper'

RSpec.describe "resource_utilizations/edit", :type => :view do
  before(:each) do
    @resource_utilization = assign(:resource_utilization, ResourceUtilization.create!(
      :resource => nil,
      :fhir_base_url => nil
    ))
  end

  it "renders the edit resource_utilization form" do
    render

    assert_select "form[action=?][method=?]", resource_utilization_path(@resource_utilization), "post" do

      assert_select "input#resource_utilization_resource[name=?]", "resource_utilization[resource]"

      assert_select "input#resource_utilization_fhir_base_url[name=?]", "resource_utilization[fhir_base_url]"
    end
  end
end
