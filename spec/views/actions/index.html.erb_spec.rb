require 'rails_helper'

RSpec.describe "actions/index", :type => :view do
  before(:each) do
    assign(:actions, [
      Action.create!(
        :action => "Action"
      ),
      Action.create!(
        :action => "Action"
      )
    ])
  end

  it "renders a list of actions" do
    render
    assert_select "tr>td", :text => "Action".to_s, :count => 2
  end
end
