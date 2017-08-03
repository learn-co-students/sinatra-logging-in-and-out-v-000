require 'sinatra/base'

class Helpers
	#methods in helps are class methods so they should be defined with 'self'
	#current_user should accept the session hash as an argument.
	#This method should use the user_id from the session hash to find the user in the database and return that user.
	def self.current_user(session)
		@user = User.find_by_id(session[:user_id])
	end


	#is_logged_in? should also accept the session hash as an argument.
	#This method should return true if the user_id is in the session hash and false if not.
	def self.is_logged_in?(session)
		#'!!' converts the value to a boolean. making the code statement true or false.
		!!session[:user_id]
	end

end
