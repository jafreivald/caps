require 'rails_helper'

RSpec.describe "fields/index", :type => :view do
  before(:each) do
    assign(:fields, [
      Field.create!(
        :field_type => "Field Type",
        :field_text => "Field Text",
        :resource => nil
      ),
      Field.create!(
        :field_type => "Field Type",
        :field_text => "Field Text",
        :resource => nil
      )
    ])
  end

  it "renders a list of fields" do
    render
    assert_select "tr>td", :text => "Field Type".to_s, :count => 2
    assert_select "tr>td", :text => "Field Text".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
