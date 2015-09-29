require 'rails_helper'

RSpec.describe "phone_providers/index", :type => :view do
  before(:each) do
    assign(:phone_providers, [
      PhoneProvider.create!(
        :phone_provider => "Phone Provider"
      ),
      PhoneProvider.create!(
        :phone_provider => "Phone Provider"
      )
    ])
  end

  it "renders a list of phone_providers" do
    render
    assert_select "tr>td", :text => "Phone Provider".to_s, :count => 2
  end
end
