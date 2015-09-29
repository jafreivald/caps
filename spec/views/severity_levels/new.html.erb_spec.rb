require 'rails_helper'

RSpec.describe "severity_levels/new", :type => :view do
  before(:each) do
    assign(:severity_level, SeverityLevel.new(
      :severity_level => "MyString"
    ))
  end

  it "renders new severity_level form" do
    render

    assert_select "form[action=?][method=?]", severity_levels_path, "post" do

      assert_select "input#severity_level_severity_level[name=?]", "severity_level[severity_level]"
    end
  end
end
