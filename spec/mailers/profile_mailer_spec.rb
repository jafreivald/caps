require "rails_helper"

RSpec.describe ProfileMailer, :type => :mailer do
  describe "password_reset" do
    profile = FactoryGirl.create(:profile, :password_reset_token => "TestResetToken")
    
    let(:mail) { ProfileMailer.password_reset(profile) }

    it "sends profile a password reset url" do
      expect(mail.subject).to eq("Password Reset")
      expect(mail.to).to eq([profile.email])
      expect(mail.from).to eq(["from@example.com"])
      expect(mail.body.encoded).to match(password_reset_path(profile.password_reset_token))
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("To reset your password, click on the URL below")
    end
  end

end
