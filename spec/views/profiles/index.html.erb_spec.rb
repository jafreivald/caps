require 'rails_helper'

RSpec.describe "profiles/index", :type => :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :userid => "Userid",
        :password_digest => "Password Digest"
      ),
      Profile.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :userid => "Userid",
        :password_digest => "Password Digest"
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Userid".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
  end
end
