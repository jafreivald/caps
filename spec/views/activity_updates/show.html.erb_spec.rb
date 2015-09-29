require 'rails_helper'

RSpec.describe "activity_updates/show", :type => :view do
  before(:each) do
    @activity_update = assign(:activity_update, ActivityUpdate.create!(
      :narrative => "MyText",
      :activity => nil,
      :profile => nil,
      :action => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
