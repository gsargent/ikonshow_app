module Devise::UsersHelper

  def roles_for(some_user)
  	some_user.roles.map(&:name).join(", ")
  end
end
