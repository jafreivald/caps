class Profile < ActiveRecord::Base
  nilify_blanks

  has_secure_password
  
  attr_accessible :email, :first_name, :last_name, :userid, :password, :password_confirmation, :password_reset_token, :password_reset_sent_at
  
  validates :password, :password_confirmation, :presence => true, :on => :create
  
  validates :first_name, :last_name, :userid, :presence => true
  validates :email, :presence => true, :uniqueness => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  
  validates_uniqueness_of :userid
  
  def full_name
    first_name + " " + last_name
  end
  
  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.zone.now
    save!
    ProfileMailer.password_reset(self).deliver
  end
  
  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Profile.exists?(column => self[column])
  end
  
  def has_expired_password_reset_token
    self.password_reset_sent_at < 4.hours.ago
  end
end
