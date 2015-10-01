require 'rails_helper'

RSpec.describe "resource_authorizations/show", :type => :view do
  before(:each) do
    @resource_authorization = assign(:resource_authorization, ResourceAuthorization.create!(
      :role_definition => nil,
      :resource => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
