require 'rails_helper'

RSpec.describe "profiles/new", :type => :view do
  before(:each) do
    assign(:profile, Profile.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :userid => "MyString",
      :password_digest => "MyString"
    ))
  end

  it "renders new profile form" do
    render

    assert_select "form[action=?][method=?]", profiles_path, "post" do

      assert_select "input#profile_first_name[name=?]", "profile[first_name]"

      assert_select "input#profile_last_name[name=?]", "profile[last_name]"

      assert_select "input#profile_email[name=?]", "profile[email]"

      assert_select "input#profile_userid[name=?]", "profile[userid]"

      assert_select "input#profile_password_digest[name=?]", "profile[password_digest]"
    end
  end
end
