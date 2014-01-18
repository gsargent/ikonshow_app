require 'spec_helper'  

describe "Home page w," do

  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  # after(:all) do
  #   @user.destroy
  # end
  
  describe "GET /root path" do
    it "works!" do
      get root_path
      response.status.should be(200)
    end
  end

  describe "GET users_path when not logged in", :type => :request do
    @user = nil
    it "should redirect to sign in page" do
      get users_path 
      puts "******" + users_path
      response.status.should be(302)  # 302 is the temporary redirect
    end
  end
  
  describe "GET users_path when logged in as regular user" do
    it "should redirect to sign in page (under test 8)" do
      get users_path
      response.status.should be(302)
    end
  end

  describe "GET users_path when logged in as administrator" do
    it "should list all users" do
      # create test role
      #puts "---before create role"
      FactoryGirl.create(:role)
  
      # create an admin user. Factory girl is not doing the roles. Need an 'admin' role
      FactoryGirl.create(:user, :admin)
      get users_path
      response.status.should be(200)
    end
  end

end
