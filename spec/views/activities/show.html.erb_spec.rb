require 'rails_helper'

RSpec.describe "activities/show", :type => :view do
  before(:each) do
    @activity = assign(:activity, Activity.create!(
      :base_time => "Base Time",
      :repeat_rule => "Repeat Rule",
      :severity_level => nil,
      :role_definition => nil,
      :activity_type => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Base Time/)
    expect(rendered).to match(/Repeat Rule/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
