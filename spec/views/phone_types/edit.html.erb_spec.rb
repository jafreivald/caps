require 'rails_helper'

RSpec.describe "phone_types/edit", :type => :view do
  before(:each) do
    @phone_type = assign(:phone_type, PhoneType.create!(
      :phone_type => "MyString"
    ))
  end

  it "renders the edit phone_type form" do
    render

    assert_select "form[action=?][method=?]", phone_type_path(@phone_type), "post" do

      assert_select "input#phone_type_phone_type[name=?]", "phone_type[phone_type]"
    end
  end
end
