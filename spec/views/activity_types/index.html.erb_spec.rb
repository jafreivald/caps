require 'rails_helper'

RSpec.describe "activity_types/index", :type => :view do
  before(:each) do
    assign(:activity_types, [
      ActivityType.create!(
        :activity_type => "Activity Type"
      ),
      ActivityType.create!(
        :activity_type => "Activity Type"
      )
    ])
  end

  it "renders a list of activity_types" do
    render
    assert_select "tr>td", :text => "Activity Type".to_s, :count => 2
  end
end
