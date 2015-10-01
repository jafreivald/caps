require 'rails_helper'

RSpec.describe "resource_authorizations/index", :type => :view do
  before(:each) do
    assign(:resource_authorizations, [
      ResourceAuthorization.create!(
        :role_definition => nil,
        :resource => nil
      ),
      ResourceAuthorization.create!(
        :role_definition => nil,
        :resource => nil
      )
    ])
  end

  it "renders a list of resource_authorizations" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
