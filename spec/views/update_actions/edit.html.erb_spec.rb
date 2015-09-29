require 'rails_helper'

RSpec.describe "update_actions/edit", :type => :view do
  before(:each) do
    @update_action = assign(:update_action, UpdateAction.create!(
      :update_action => "MyString"
    ))
  end

  it "renders the edit update_action form" do
    render

    assert_select "form[action=?][method=?]", update_action_path(@update_action), "post" do

      assert_select "input#update_action_update_action[name=?]", "update_action[update_action]"
    end
  end
end
