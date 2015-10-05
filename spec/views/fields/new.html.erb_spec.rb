require 'rails_helper'

RSpec.describe "fields/new", :type => :view do
  before(:each) do
    assign(:field, Field.new(
      :field_type => "MyString",
      :field_text => "MyString",
      :resource => nil
    ))
  end

  it "renders new field form" do
    render

    assert_select "form[action=?][method=?]", fields_path, "post" do

      assert_select "input#field_field_type[name=?]", "field[field_type]"

      assert_select "input#field_field_text[name=?]", "field[field_text]"

      assert_select "input#field_resource[name=?]", "field[resource]"
    end
  end
end
