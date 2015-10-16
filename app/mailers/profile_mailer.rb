class ProfileMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.profile_mailer.password_reset.subject
  #
  def password_reset(profile)
    @profile = profile
    mail :to => profile.email, :subject => "Password Reset"
  end
end
