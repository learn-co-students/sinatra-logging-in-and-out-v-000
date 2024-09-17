class Helpers
	def self.current_user(session)
		if self.is_logged_in?(session)
			User.find(session[:user_id])
		end
	end

	def self.is_logged_in?(session)
		!!session[:user_id]
	end
end