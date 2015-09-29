require 'rails_helper'

RSpec.describe "profiles/show", :type => :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :userid => "Userid",
      :password_digest => "Password Digest"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Userid/)
    expect(rendered).to match(/Password Digest/)
  end
end
