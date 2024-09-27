class Helpers

	def self.current_user(session)
		@user = User.find(session[:user_id])
	end 

	def self.is_logged_in?(session)
		# binding.pry
		if session[:user_id] == Helpers.current_user(session).id
			true 
		else 
			false 
		end 
	end 
end