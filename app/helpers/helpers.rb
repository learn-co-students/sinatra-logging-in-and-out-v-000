require 'pry'
class Helpers

	def self.current_user(session)
		#binding.pry
		@user = User.find_by_id(session[:user_id])
	end

	def self.is_logged_in?(session)
		#binding.pry
		!!session[:user_id]
	end

end