require 'pry'

class Helpers

	def self.current_user(session)
		user_id = session[:user_id]
		User.find(user_id)
	end

	def self.is_logged_in?(session)
		!!session[:user_id]
	end
end