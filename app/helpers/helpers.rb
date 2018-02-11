class Helpers
	#these two methods will only be called in views 

	def self.current_user(session)
		@user = User.find_by_id(session[:user_id])
	end

	def self.is_logged_in?(session)
		session[:user_id] != nil
		# !!session[:user_id]
	end
end