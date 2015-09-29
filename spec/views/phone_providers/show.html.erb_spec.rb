require 'rails_helper'

RSpec.describe "phone_providers/show", :type => :view do
  before(:each) do
    @phone_provider = assign(:phone_provider, PhoneProvider.create!(
      :phone_provider => "Phone Provider"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Phone Provider/)
  end
end
