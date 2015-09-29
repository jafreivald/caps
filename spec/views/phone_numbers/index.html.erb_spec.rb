require 'rails_helper'

RSpec.describe "phone_numbers/index", :type => :view do
  before(:each) do
    assign(:phone_numbers, [
      PhoneNumber.create!(
        :country_code => "Country Code",
        :area_code => "Area Code",
        :number => "Number",
        :phone_provider => nil,
        :phone_type => nil
      ),
      PhoneNumber.create!(
        :country_code => "Country Code",
        :area_code => "Area Code",
        :number => "Number",
        :phone_provider => nil,
        :phone_type => nil
      )
    ])
  end

  it "renders a list of phone_numbers" do
    render
    assert_select "tr>td", :text => "Country Code".to_s, :count => 2
    assert_select "tr>td", :text => "Area Code".to_s, :count => 2
    assert_select "tr>td", :text => "Number".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
