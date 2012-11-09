require 'spec_helper'

describe User do

  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  describe "validations" do

  end

  describe "attributes" do
    it "should respond to :username" do
      @user.should respond_to(:username)
    end
    it "should respond to :uid" do
      @user.should respond_to(:uid)
    end
    it "should respond to :provider" do
      @user.should respond_to(:provider)
    end
    it "should respond to :github_token" do
      @user.should respond_to(:github_token)
    end
    it "should respond to :location" do
      @user.should respond_to(:location)
    end
    it "should respond to :organizations" do
      @user.should respond_to(:organizations)
    end
    it "should respond to :gists" do
      @user.should respond_to(:gists)
    end
    it "should respond_to :repos" do
      @user.should respond_to(:repos)
    end
    it "should respond_to :github_user?" do
      @user.should respond_to(:github_user?)
    end
  end
end
