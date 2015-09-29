require 'rails_helper'

RSpec.describe "phone_providers/new", :type => :view do
  before(:each) do
    assign(:phone_provider, PhoneProvider.new(
      :phone_provider => "MyString"
    ))
  end

  it "renders new phone_provider form" do
    render

    assert_select "form[action=?][method=?]", phone_providers_path, "post" do

      assert_select "input#phone_provider_phone_provider[name=?]", "phone_provider[phone_provider]"
    end
  end
end
