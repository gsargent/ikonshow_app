class HomeController < ApplicationController
  # tell Devise no authentication needed for this controller
  skip_before_filter :authenticate_user! 

  def index
  end

end
