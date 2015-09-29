require 'rails_helper'

RSpec.describe "actions/show", :type => :view do
  before(:each) do
    @action = assign(:action, Action.create!(
      :action => "Action"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Action/)
  end
end
