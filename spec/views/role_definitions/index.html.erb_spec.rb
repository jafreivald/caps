require 'rails_helper'

RSpec.describe "role_definitions/index", :type => :view do
  before(:each) do
    assign(:role_definitions, [
      RoleDefinition.create!(
        :role => nil,
        :profile => nil,
        :resource_utilization => nil
      ),
      RoleDefinition.create!(
        :role => nil,
        :profile => nil,
        :resource_utilization => nil
      )
    ])
  end

  it "renders a list of role_definitions" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
