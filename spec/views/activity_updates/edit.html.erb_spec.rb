require 'rails_helper'

RSpec.describe "activity_updates/edit", :type => :view do
  before(:each) do
    @activity_update = assign(:activity_update, ActivityUpdate.create!(
      :narrative => "MyText",
      :activity => nil,
      :profile => nil,
      :action => nil
    ))
  end

  it "renders the edit activity_update form" do
    render

    assert_select "form[action=?][method=?]", activity_update_path(@activity_update), "post" do

      assert_select "textarea#activity_update_narrative[name=?]", "activity_update[narrative]"

      assert_select "input#activity_update_activity[name=?]", "activity_update[activity]"

      assert_select "input#activity_update_profile[name=?]", "activity_update[profile]"

      assert_select "input#activity_update_action[name=?]", "activity_update[action]"
    end
  end
end
