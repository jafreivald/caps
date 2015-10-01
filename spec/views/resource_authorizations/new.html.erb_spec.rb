require 'rails_helper'

RSpec.describe "resource_authorizations/new", :type => :view do
  before(:each) do
    assign(:resource_authorization, ResourceAuthorization.new(
      :role_definition => nil,
      :resource => nil
    ))
  end

  it "renders new resource_authorization form" do
    render

    assert_select "form[action=?][method=?]", resource_authorizations_path, "post" do

      assert_select "input#resource_authorization_role_definition[name=?]", "resource_authorization[role_definition]"

      assert_select "input#resource_authorization_resource[name=?]", "resource_authorization[resource]"
    end
  end
end
