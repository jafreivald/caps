require 'rails_helper'

RSpec.describe "resource_utilizations/index", :type => :view do
  before(:each) do
    assign(:resource_utilizations, [
      ResourceUtilization.create!(
        :resource => nil,
        :fhir_base_url => nil
      ),
      ResourceUtilization.create!(
        :resource => nil,
        :fhir_base_url => nil
      )
    ])
  end

  it "renders a list of resource_utilizations" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
