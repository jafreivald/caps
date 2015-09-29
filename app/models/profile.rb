class Profile < ActiveRecord::Base
  has_secure_password
  
  attr_accessible :email, :first_name, :last_name, :userid, :password, :password_confirmation
  
  validates_presence_of :password, :on => :create
  validates_presence_of :password, :on => :update
  
  validates_presence_of :email, :first_name, :last_name, :userid
  
  validates_uniqueness_of :email
  validates_uniqueness_of :userid
end
