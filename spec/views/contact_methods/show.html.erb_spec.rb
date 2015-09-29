require 'rails_helper'

RSpec.describe "contact_methods/show", :type => :view do
  before(:each) do
    @contact_method = assign(:contact_method, ContactMethod.create!(
      :contact_method => "Contact Method"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Contact Method/)
  end
end
