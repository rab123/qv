require 'spec_helper'

describe User do
  describe "valid user" do
    before(:each) do
      @user = User.new
      @user.email = "rab@uslex.net"
      @user.password = "videoproject"
      @user.save
    end
    
    it "should return user if email exists in db" do
      @user = User.get_user("rab@uslex.net").should be_true
    end
    
    it "should return true for valid email and password" do
      User.authenticate("rab@uslex.net", "videoproject").should be_true
    end
  end
  
  describe "invalid user" do
    before(:each) do
      @email_addr = "peter@example.com"
      @password = "secret"
    end    
    
    it "should return false if email does not exist" do
      User.get_user(@email_addr).should be_false
    end
    
    it "should return false if password is wrong" do
        User.authenticate(@email_addr, @password)
    end
  end
end
