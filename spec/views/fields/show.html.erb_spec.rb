require 'rails_helper'

RSpec.describe "fields/show", :type => :view do
  before(:each) do
    @field = assign(:field, Field.create!(
      :field_type => "Field Type",
      :field_text => "Field Text",
      :resource => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Field Type/)
    expect(rendered).to match(/Field Text/)
    expect(rendered).to match(//)
  end
end
