# class AdminController < Devise::RegistrationsController
class AdminsController < ApplicationController
  def index
    @users = User.all
    puts 'regular admin controller ********'
  end
end