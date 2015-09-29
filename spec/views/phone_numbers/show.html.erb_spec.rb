require 'rails_helper'

RSpec.describe "phone_numbers/show", :type => :view do
  before(:each) do
    @phone_number = assign(:phone_number, PhoneNumber.create!(
      :country_code => "Country Code",
      :area_code => "Area Code",
      :number => "Number",
      :phone_provider => nil,
      :phone_type => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Country Code/)
    expect(rendered).to match(/Area Code/)
    expect(rendered).to match(/Number/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
