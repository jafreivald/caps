require 'rails_helper'

RSpec.describe "fields/edit", :type => :view do
  before(:each) do
    @field = assign(:field, Field.create!(
      :field_type => "MyString",
      :field_text => "MyString",
      :resource => nil
    ))
  end

  it "renders the edit field form" do
    render

    assert_select "form[action=?][method=?]", field_path(@field), "post" do

      assert_select "input#field_field_type[name=?]", "field[field_type]"

      assert_select "input#field_field_text[name=?]", "field[field_text]"

      assert_select "input#field_resource[name=?]", "field[resource]"
    end
  end
end
