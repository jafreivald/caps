require 'rails_helper'

RSpec.describe "role_definitions/edit", :type => :view do
  before(:each) do
    @role_definition = assign(:role_definition, RoleDefinition.create!(
      :role => nil,
      :profile => nil,
      :resource_utilization => nil
    ))
  end

  it "renders the edit role_definition form" do
    render

    assert_select "form[action=?][method=?]", role_definition_path(@role_definition), "post" do

      assert_select "input#role_definition_role[name=?]", "role_definition[role]"

      assert_select "input#role_definition_profile[name=?]", "role_definition[profile]"

      assert_select "input#role_definition_resource_utilization[name=?]", "role_definition[resource_utilization]"
    end
  end
end
