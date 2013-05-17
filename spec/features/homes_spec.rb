require 'spec_helper'  

describe "Homes" do
  describe "GET /homes" do
     it "should have the content 'Welcome'" do
      visit '/'
      page.should have_content('Welcome')
    end
  end
  
   
end
