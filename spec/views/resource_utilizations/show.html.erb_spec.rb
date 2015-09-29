require 'rails_helper'

RSpec.describe "resource_utilizations/show", :type => :view do
  before(:each) do
    @resource_utilization = assign(:resource_utilization, ResourceUtilization.create!(
      :resource => nil,
      :fhir_base_url => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
