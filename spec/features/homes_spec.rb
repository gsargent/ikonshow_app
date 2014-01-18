require 'spec_helper'  

describe "Home page" do
  describe "GET /homes" do
     it "should have the content 'Welcome'" do
      visit '/'
      page.should have_content('Welcome')
    end
  end
  
   
end
