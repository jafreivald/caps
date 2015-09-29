require 'rails_helper'

RSpec.describe "contact_numbers/index", :type => :view do
  before(:each) do
    assign(:contact_numbers, [
      ContactNumber.create!(
        :preferred => false,
        :contact_method => nil,
        :phone_number => nil,
        :profile => nil
      ),
      ContactNumber.create!(
        :preferred => false,
        :contact_method => nil,
        :phone_number => nil,
        :profile => nil
      )
    ])
  end

  it "renders a list of contact_numbers" do
    render
    assert_select "tr>td", :text => false.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
