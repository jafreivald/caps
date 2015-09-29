require 'rails_helper'

RSpec.describe "severity_levels/index", :type => :view do
  before(:each) do
    assign(:severity_levels, [
      SeverityLevel.create!(
        :severity_level => "Severity Level"
      ),
      SeverityLevel.create!(
        :severity_level => "Severity Level"
      )
    ])
  end

  it "renders a list of severity_levels" do
    render
    assert_select "tr>td", :text => "Severity Level".to_s, :count => 2
  end
end
