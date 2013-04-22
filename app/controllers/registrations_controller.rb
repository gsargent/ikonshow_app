class RegistrationsController < Devise::RegistrationsController
  require 'awesome_print'

  # GET /exercises/1/edit
  def edit 
    puts "EDIT7777777777"
    ap current_user
  end

  # POST /users
  def update
    puts "UPDATE88888888"
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

    # test that user didn't hack roles. The roles that went out should be the roles that came in
    @user = User.find current_user.id
    old_role_ids = @user.roles.pluck(:id)
    puts "roles0: #{old_role_ids}"
    new_role_ids = params["user"]["role_ids"]
    puts "roles1: #{new_role_ids}"
    puts "-----done 0 --------"
    super
 
  end
end
