require 'rails_helper'

RSpec.describe "activities/index", :type => :view do
  before(:each) do
    assign(:activities, [
      Activity.create!(
        :base_time => "Base Time",
        :repeat_rule => "Repeat Rule",
        :severity_level => nil,
        :role_definition => nil,
        :activity_type => nil
      ),
      Activity.create!(
        :base_time => "Base Time",
        :repeat_rule => "Repeat Rule",
        :severity_level => nil,
        :role_definition => nil,
        :activity_type => nil
      )
    ])
  end

  it "renders a list of activities" do
    render
    assert_select "tr>td", :text => "Base Time".to_s, :count => 2
    assert_select "tr>td", :text => "Repeat Rule".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
