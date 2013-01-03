module ExercisesHelper

	# The users and exercises tables have a 1:m relationship.

	# When creating or editing exercises, get its foreign key (user_id) or follow
	# the foreign key to the users table to retrieve the username:
	#   if there is no @exercise object, use the current user's id or username.
	#   if the @exercise object exists, traverse the relationship to get value
	#   from its parent object.

	def get_existing_value_else_current_user_id
		@exercise.user_id.nil? ? current_user.id : @exercise.user_id
	end

	def get_existing_value_else_current_username

		@exercise.user_id.nil? ? current_user.username : @exercise.user.username
	end
end
