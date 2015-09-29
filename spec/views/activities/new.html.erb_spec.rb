require 'rails_helper'

RSpec.describe "activities/new", :type => :view do
  before(:each) do
    assign(:activity, Activity.new(
      :base_time => "MyString",
      :repeat_rule => "MyString",
      :severity_level => nil,
      :role_definition => nil,
      :activity_type => nil
    ))
  end

  it "renders new activity form" do
    render

    assert_select "form[action=?][method=?]", activities_path, "post" do

      assert_select "input#activity_base_time[name=?]", "activity[base_time]"

      assert_select "input#activity_repeat_rule[name=?]", "activity[repeat_rule]"

      assert_select "input#activity_severity_level[name=?]", "activity[severity_level]"

      assert_select "input#activity_role_definition[name=?]", "activity[role_definition]"

      assert_select "input#activity_activity_type[name=?]", "activity[activity_type]"
    end
  end
end
