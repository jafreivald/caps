require 'rails_helper'

RSpec.describe "resource_types/show", :type => :view do
  before(:each) do
    @resource_type = assign(:resource_type, ResourceType.create!(
      :resource_type => "Resource Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Resource Type/)
  end
end
