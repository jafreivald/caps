require 'rails_helper'

RSpec.describe "resources/show", :type => :view do
  before(:each) do
    @resource = assign(:resource, Resource.create!(
      :resource => "Resource"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Resource/)
  end
end
