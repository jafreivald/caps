require 'rails_helper'

RSpec.describe "phone_types/new", :type => :view do
  before(:each) do
    assign(:phone_type, PhoneType.new(
      :phone_type => "MyString"
    ))
  end

  it "renders new phone_type form" do
    render

    assert_select "form[action=?][method=?]", phone_types_path, "post" do

      assert_select "input#phone_type_phone_type[name=?]", "phone_type[phone_type]"
    end
  end
end
