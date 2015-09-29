require 'rails_helper'

RSpec.describe "severity_levels/show", :type => :view do
  before(:each) do
    @severity_level = assign(:severity_level, SeverityLevel.create!(
      :severity_level => "Severity Level"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Severity Level/)
  end
end
