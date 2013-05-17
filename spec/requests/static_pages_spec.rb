require 'spec_helper'  

describe "Homes" do
  
   describe "GET user_path", :type => :request do
    it "works! " do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get users_path 
      response.status.should be(301)
    end
  end
  
  describe "GET /root path" do
    it "works! " do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get root_path
      response.status.should be(200)
    end
  end
end
