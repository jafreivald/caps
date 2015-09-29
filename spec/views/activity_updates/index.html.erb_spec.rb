require 'rails_helper'

RSpec.describe "activity_updates/index", :type => :view do
  before(:each) do
    assign(:activity_updates, [
      ActivityUpdate.create!(
        :narrative => "MyText",
        :activity => nil,
        :profile => nil,
        :action => nil
      ),
      ActivityUpdate.create!(
        :narrative => "MyText",
        :activity => nil,
        :profile => nil,
        :action => nil
      )
    ])
  end

  it "renders a list of activity_updates" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
