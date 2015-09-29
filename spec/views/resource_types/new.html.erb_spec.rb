require 'rails_helper'

RSpec.describe "resource_types/new", :type => :view do
  before(:each) do
    assign(:resource_type, ResourceType.new(
      :resource_type => "MyString"
    ))
  end

  it "renders new resource_type form" do
    render

    assert_select "form[action=?][method=?]", resource_types_path, "post" do

      assert_select "input#resource_type_resource_type[name=?]", "resource_type[resource_type]"
    end
  end
end
