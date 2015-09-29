require 'rails_helper'

RSpec.describe "resource_types/index", :type => :view do
  before(:each) do
    assign(:resource_types, [
      ResourceType.create!(
        :resource_type => "Resource Type"
      ),
      ResourceType.create!(
        :resource_type => "Resource Type"
      )
    ])
  end

  it "renders a list of resource_types" do
    render
    assert_select "tr>td", :text => "Resource Type".to_s, :count => 2
  end
end
