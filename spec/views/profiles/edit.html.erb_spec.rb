require 'rails_helper'

RSpec.describe "profiles/edit", :type => :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :userid => "MyString",
      :password_digest => "MyString"
    ))
  end

  it "renders the edit profile form" do
    render

    assert_select "form[action=?][method=?]", profile_path(@profile), "post" do

      assert_select "input#profile_first_name[name=?]", "profile[first_name]"

      assert_select "input#profile_last_name[name=?]", "profile[last_name]"

      assert_select "input#profile_email[name=?]", "profile[email]"

      assert_select "input#profile_userid[name=?]", "profile[userid]"

      assert_select "input#profile_password_digest[name=?]", "profile[password_digest]"
    end
  end
end
