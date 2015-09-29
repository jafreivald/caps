require 'rails_helper'

RSpec.describe "resources/index", :type => :view do
  before(:each) do
    assign(:resources, [
      Resource.create!(
        :resource => "Resource"
      ),
      Resource.create!(
        :resource => "Resource"
      )
    ])
  end

  it "renders a list of resources" do
    render
    assert_select "tr>td", :text => "Resource".to_s, :count => 2
  end
end
