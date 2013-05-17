class RegistrationsController < Devise::RegistrationsController
  require 'awesome_print'
  helper_method :roles_user_can_have

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
    allowed_role_ids = roles_user_can_have.map(&:id)
    puts "roles0: #{allowed_role_ids}"
    new_role_ids = params["user"]["role_ids"].map do |id| 
      next if id.empty? 
      id.to_i if id.match(/^\d+$/)
    end.compact # to eliminate nils
 
    puts "roles1: #{new_role_ids}"
    puts "-----done 0 --------"
    super
 
  end


  # helpers
  def roles_user_can_have
    # goal is to prevent hackers from taking on the admin role.
    # read database & return an array of role objects sans the admin role
    allowd_roles = Role.all.map do |role|
      next if role.name == "admin" 
      role
    end
    
    allowd_roles
  end
end
