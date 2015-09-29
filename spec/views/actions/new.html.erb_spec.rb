require 'rails_helper'

RSpec.describe "actions/new", :type => :view do
  before(:each) do
    assign(:action, Action.new(
      :action => "MyString"
    ))
  end

  it "renders new action form" do
    render

    assert_select "form[action=?][method=?]", actions_path, "post" do

      assert_select "input#action_action[name=?]", "action[action]"
    end
  end
end
