require 'rails_helper'

RSpec.describe "update_actions/new", :type => :view do
  before(:each) do
    assign(:update_action, UpdateAction.new(
      :update_action => "MyString"
    ))
  end

  it "renders new update_action form" do
    render

    assert_select "form[action=?][method=?]", update_actions_path, "post" do

      assert_select "input#update_action_update_action[name=?]", "update_action[update_action]"
    end
  end
end
