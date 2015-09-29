require 'rails_helper'

RSpec.describe "contact_methods/index", :type => :view do
  before(:each) do
    assign(:contact_methods, [
      ContactMethod.create!(
        :contact_method => "Contact Method"
      ),
      ContactMethod.create!(
        :contact_method => "Contact Method"
      )
    ])
  end

  it "renders a list of contact_methods" do
    render
    assert_select "tr>td", :text => "Contact Method".to_s, :count => 2
  end
end
