require 'rails_helper'

RSpec.describe "phone_providers/edit", :type => :view do
  before(:each) do
    @phone_provider = assign(:phone_provider, PhoneProvider.create!(
      :phone_provider => "MyString"
    ))
  end

  it "renders the edit phone_provider form" do
    render

    assert_select "form[action=?][method=?]", phone_provider_path(@phone_provider), "post" do

      assert_select "input#phone_provider_phone_provider[name=?]", "phone_provider[phone_provider]"
    end
  end
end
