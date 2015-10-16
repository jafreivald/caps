# File Created by Joseph Freivald
# Copyright (c) 2015
# All Rights Reserved. Use pursuant to Joseph Freivald's instructions.

module MailerMacros
  def last_email
    ActionMailer::Base.deliveries.last
  end
  
  def reset_emails
    ActionMailer::Base.deliveries = []
  end
end
