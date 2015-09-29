require 'rails_helper'

RSpec.describe "contact_numbers/show", :type => :view do
  before(:each) do
    @contact_number = assign(:contact_number, ContactNumber.create!(
      :preferred => false,
      :contact_method => nil,
      :phone_number => nil,
      :profile => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/false/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
