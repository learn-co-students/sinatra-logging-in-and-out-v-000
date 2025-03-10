class Helpers
	def self.current_user(args)
		User.find(args[:user_id])
	end

	def self.is_logged_in?(args)
		args.include?(:user_id)
	end

end