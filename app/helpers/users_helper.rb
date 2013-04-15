module UsersHelper
  require "awesome_print"

  def make_role_checkboxes_except_admin(my_roles)
		my_roles.all.each do |role|
			continue if role.name == :admin

			check_box_tag "user[role_ids][]", role_id
			role.name
		end
  end


	def get_my_roles
		#roles_for(current_user)

		current_user.roles
	end
end
