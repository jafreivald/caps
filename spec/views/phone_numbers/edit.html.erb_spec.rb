require 'rails_helper'

RSpec.describe "phone_numbers/edit", :type => :view do
  before(:each) do
    @phone_number = assign(:phone_number, PhoneNumber.create!(
      :country_code => "MyString",
      :area_code => "MyString",
      :number => "MyString",
      :phone_provider => nil,
      :phone_type => nil
    ))
  end

  it "renders the edit phone_number form" do
    render

    assert_select "form[action=?][method=?]", phone_number_path(@phone_number), "post" do

      assert_select "input#phone_number_country_code[name=?]", "phone_number[country_code]"

      assert_select "input#phone_number_area_code[name=?]", "phone_number[area_code]"

      assert_select "input#phone_number_number[name=?]", "phone_number[number]"

      assert_select "input#phone_number_phone_provider[name=?]", "phone_number[phone_provider]"

      assert_select "input#phone_number_phone_type[name=?]", "phone_number[phone_type]"
    end
  end
end
