require 'rails_helper'

RSpec.describe "contact_methods/new", :type => :view do
  before(:each) do
    assign(:contact_method, ContactMethod.new(
      :contact_method => "MyString"
    ))
  end

  it "renders new contact_method form" do
    render

    assert_select "form[action=?][method=?]", contact_methods_path, "post" do

      assert_select "input#contact_method_contact_method[name=?]", "contact_method[contact_method]"
    end
  end
end
