require 'spec_helper' 

include Warden::Test::Helpers
Warden.test_mode!

def create_regular_user( sign_in = false )
  user = FactoryGirl.create(:user)
  sign_me_in user if sign_in
end
def create_admin_user (sign_in = false)
  user = FactoryGirl.create(:user, :admin)
  sign_me_in user if sign_in
end
def sign_me_in me
  login_as(me, :scope => :user)

  # When Devise confirmable is used, must set confirmed_at. See Devise wiki: 
  # https://github.com/plataformatec/devise/wiki/How-To:-Test-with-Capybara
  me.confirmed_at = Time.now
  me.save
end





describe "Home page ** an **," do

  before(:each) do
    #user = FactoryGirl.create(:user)
  end

  after(:each) do
    # devise wiki said do this
    Warden.test_reset!
  end
  
  describe "GET /root path" do
    it "works!" do
      get root_path
      response.status.should be(200)
    end
  end

  describe "GET users_path when not logged in", :type => :request do
    #create_regular_user

    it "should redirect to sign in page" do
      get users_path 
      puts "******" + users_path
      response.status.should be(302)  # 302 is the temporary redirect
    end
  end
  
  describe "GET users_path when logged in as regular user" do
    create_regular_user(true)
    it "should redirect to sign in page (under test 8)" do
      get users_path
      response.status.should be(200)
    end
  end

  describe "GET users_path when logged in as administrator" do
    create_admin_user(true)

    it "should list all users" do
      # create test role
      #puts "---before create role"
      FactoryGirl.create(:role)
  
      # create an admin user. Factory girl is not doing the roles. Need an 'admin' role
      #FactoryGirl.create(:user, :admin)
      get users_path
      response.status.should be(200)
    end
  end

end
