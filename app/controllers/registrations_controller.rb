class RegistrationsController < Devise::RegistrationsController
  require 'awesome_print'

 
  # POST /users
  def update

  	#@user = User.find(params[:user][:id])

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

  # 	if not @user.update_attributes(params[:user])
  #     puts "7777 worked 7777"
  # 		redirect_to @user, notice: 'User was successfully updated.'
  # 	else
  #     puts "8888 failed 8888"
  # 		render :edit
  # 	end
  end
end
