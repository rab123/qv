require 'spec_helper'

describe UserAccessController do

  describe "GET 'menu'" do
    it "should be successful" do
      get 'menu'
      response.should be_success
    end
  end

  describe "GET 'login'" do
    it "should be successful" do
      get 'login'
      response.should be_success
    end
  end

end
