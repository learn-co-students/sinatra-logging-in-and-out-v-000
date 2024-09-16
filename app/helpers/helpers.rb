class Helpers

	def self.current_user(session)
		User.find(session[:user_id]) if is_logged_in?(session)
	end

	def self.is_logged_in?(session)
		session[:user_id]!=nil
	end
end
