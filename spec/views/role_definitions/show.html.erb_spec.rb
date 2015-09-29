require 'rails_helper'

RSpec.describe "role_definitions/show", :type => :view do
  before(:each) do
    @role_definition = assign(:role_definition, RoleDefinition.create!(
      :role => nil,
      :profile => nil,
      :resource_utilization => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
