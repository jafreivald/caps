require 'rails_helper'

RSpec.describe "update_actions/index", :type => :view do
  before(:each) do
    assign(:update_actions, [
      UpdateAction.create!(
        :update_action => "Update Action"
      ),
      UpdateAction.create!(
        :update_action => "Update Action"
      )
    ])
  end

  it "renders a list of update_actions" do
    render
    assert_select "tr>td", :text => "Update Action".to_s, :count => 2
  end
end
