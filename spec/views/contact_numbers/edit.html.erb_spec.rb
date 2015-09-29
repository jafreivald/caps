require 'rails_helper'

RSpec.describe "contact_numbers/edit", :type => :view do
  before(:each) do
    @contact_number = assign(:contact_number, ContactNumber.create!(
      :preferred => false,
      :contact_method => nil,
      :phone_number => nil,
      :profile => nil
    ))
  end

  it "renders the edit contact_number form" do
    render

    assert_select "form[action=?][method=?]", contact_number_path(@contact_number), "post" do

      assert_select "input#contact_number_preferred[name=?]", "contact_number[preferred]"

      assert_select "input#contact_number_contact_method[name=?]", "contact_number[contact_method]"

      assert_select "input#contact_number_phone_number[name=?]", "contact_number[phone_number]"

      assert_select "input#contact_number_profile[name=?]", "contact_number[profile]"
    end
  end
end
