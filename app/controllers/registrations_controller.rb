class RegistrationsController < Devise::RegistrationsController
  require 'awesome_print'

  # GET /exercises/1/edit
  def edit 
    puts "7777777777"
    ap current_user
  end

  # POST /users
  def update

    # note: if password was not changed it does not need to be set, remove
    #       passwords from the params
    if params[:user][:password].length == 0 then
      params[:user].delete :password
      params[:user].delete :password_confirmation
      ap params[:user]
    end

    ap current_user
    ap current_user.roles
    puts "=============="
    super
 
  end
end
