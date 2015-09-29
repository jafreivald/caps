require 'rails_helper'

RSpec.describe "phone_types/index", :type => :view do
  before(:each) do
    assign(:phone_types, [
      PhoneType.create!(
        :phone_type => "Phone Type"
      ),
      PhoneType.create!(
        :phone_type => "Phone Type"
      )
    ])
  end

  it "renders a list of phone_types" do
    render
    assert_select "tr>td", :text => "Phone Type".to_s, :count => 2
  end
end
