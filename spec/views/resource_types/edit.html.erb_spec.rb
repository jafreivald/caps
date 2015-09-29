require 'rails_helper'

RSpec.describe "resource_types/edit", :type => :view do
  before(:each) do
    @resource_type = assign(:resource_type, ResourceType.create!(
      :resource_type => "MyString"
    ))
  end

  it "renders the edit resource_type form" do
    render

    assert_select "form[action=?][method=?]", resource_type_path(@resource_type), "post" do

      assert_select "input#resource_type_resource_type[name=?]", "resource_type[resource_type]"
    end
  end
end
