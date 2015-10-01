require 'rails_helper'

RSpec.describe "resource_authorizations/edit", :type => :view do
  before(:each) do
    @resource_authorization = assign(:resource_authorization, ResourceAuthorization.create!(
      :role_definition => nil,
      :resource => nil
    ))
  end

  it "renders the edit resource_authorization form" do
    render

    assert_select "form[action=?][method=?]", resource_authorization_path(@resource_authorization), "post" do

      assert_select "input#resource_authorization_role_definition[name=?]", "resource_authorization[role_definition]"

      assert_select "input#resource_authorization_resource[name=?]", "resource_authorization[resource]"
    end
  end
end
