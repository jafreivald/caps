require 'rails_helper'

RSpec.describe "phone_types/show", :type => :view do
  before(:each) do
    @phone_type = assign(:phone_type, PhoneType.create!(
      :phone_type => "Phone Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Phone Type/)
  end
end
