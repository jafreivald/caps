require 'rails_helper'

RSpec.describe "actions/edit", :type => :view do
  before(:each) do
    @action = assign(:action, Action.create!(
      :action => "MyString"
    ))
  end

  it "renders the edit action form" do
    render

    assert_select "form[action=?][method=?]", action_path(@action), "post" do

      assert_select "input#action_action[name=?]", "action[action]"
    end
  end
end
