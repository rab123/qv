require 'digest/sha1'
class User < ActiveRecord::Base
  EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  
  attr_accessor :password
  
  attr_protected :pw, :salt
  
  # only validate on_create so other user attributes can be changed
  validates_length_of :password, :within => 6..25, :on => :create
  
  before_save :create_pw_hash
  after_save :clear_password
  
  def self.authenticate(email_addr, password)
    user = User.get_user(email_addr)
    if user && user.pw == User.hash_with_salt(password, user.salt)
      return user
    else
      return false
    end
  end
  
  def self.get_user(email_addr)
    @user = User.find_by_email(email_addr)
  end  
  
  def self.make_salt(email_addr="")
    Digest::SHA1.hexdigest("Use #{email_addr} with #{Time.now} to make salt")
  end
  
  def self.hash_with_salt(password="", salt="")
    Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end
  
  private
  
  def create_pw_hash
    # whenever password has a value, hash it
    unless password.blank?
      self.salt = User.make_salt(self.email) if salt.blank?
      self.pw = User.hash_with_salt(password,self.salt)
    end
  end
  
  def clear_password
    # for security and because hashing is not needed
    self.password = nil
  end
  
end
