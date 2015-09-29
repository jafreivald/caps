require 'rails_helper'

RSpec.describe "activity_updates/new", :type => :view do
  before(:each) do
    assign(:activity_update, ActivityUpdate.new(
      :narrative => "MyText",
      :activity => nil,
      :profile => nil,
      :action => nil
    ))
  end

  it "renders new activity_update form" do
    render

    assert_select "form[action=?][method=?]", activity_updates_path, "post" do

      assert_select "textarea#activity_update_narrative[name=?]", "activity_update[narrative]"

      assert_select "input#activity_update_activity[name=?]", "activity_update[activity]"

      assert_select "input#activity_update_profile[name=?]", "activity_update[profile]"

      assert_select "input#activity_update_action[name=?]", "activity_update[action]"
    end
  end
end
