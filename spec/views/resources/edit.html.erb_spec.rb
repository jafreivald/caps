require 'rails_helper'

RSpec.describe "resources/edit", :type => :view do
  before(:each) do
    @resource = assign(:resource, Resource.create!(
      :resource => "MyString"
    ))
  end

  it "renders the edit resource form" do
    render

    assert_select "form[action=?][method=?]", resource_path(@resource), "post" do

      assert_select "input#resource_resource[name=?]", "resource[resource]"
    end
  end
end
