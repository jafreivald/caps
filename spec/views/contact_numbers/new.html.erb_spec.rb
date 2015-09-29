require 'rails_helper'

RSpec.describe "contact_numbers/new", :type => :view do
  before(:each) do
    assign(:contact_number, ContactNumber.new(
      :preferred => false,
      :contact_method => nil,
      :phone_number => nil,
      :profile => nil
    ))
  end

  it "renders new contact_number form" do
    render

    assert_select "form[action=?][method=?]", contact_numbers_path, "post" do

      assert_select "input#contact_number_preferred[name=?]", "contact_number[preferred]"

      assert_select "input#contact_number_contact_method[name=?]", "contact_number[contact_method]"

      assert_select "input#contact_number_phone_number[name=?]", "contact_number[phone_number]"

      assert_select "input#contact_number_profile[name=?]", "contact_number[profile]"
    end
  end
end
