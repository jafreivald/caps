require 'rails_helper'

RSpec.describe "update_actions/show", :type => :view do
  before(:each) do
    @update_action = assign(:update_action, UpdateAction.create!(
      :update_action => "Update Action"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Update Action/)
  end
end
