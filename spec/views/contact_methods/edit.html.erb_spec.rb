require 'rails_helper'

RSpec.describe "contact_methods/edit", :type => :view do
  before(:each) do
    @contact_method = assign(:contact_method, ContactMethod.create!(
      :contact_method => "MyString"
    ))
  end

  it "renders the edit contact_method form" do
    render

    assert_select "form[action=?][method=?]", contact_method_path(@contact_method), "post" do

      assert_select "input#contact_method_contact_method[name=?]", "contact_method[contact_method]"
    end
  end
end
