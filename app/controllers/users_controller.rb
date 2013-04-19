# class UsersController < Devise::RegistrationsController
class UsersController < ApplicationController
  # cancan gem load's instance variables, e.g. @Exercise
  #load_and_authorize_resource     #cancan
  # therefore the usual instance variable lines 
  # are loaded by cancan and are commented out below & labeled 'cancan'

	# GET /users
	def index
    @users = User.all
    puts '********users controller*****************'
	end

  # GET /users/1
  def show
  	@user = User.find(params[:id])
  end

  # GET /user/1/edit
  def edit
  	@user = User.find(params[:id])
    puts "geo says editttt"
  end

  # POST /users
  def update
    @user = User.find(params[:id])

    puts "about update xxxx"

    if @user.update_attributes(params[:user])
    	redirect_to @user, notice: 'User was successfully updated.'
    else
    	render action: 'edit'
    end
  end
end
