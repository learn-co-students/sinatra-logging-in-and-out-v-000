require 'sinatra/base'

class Helpers


	def self.current_user(session)
binding.pry
		@user = User.find_by_id(session[:user_id])
		# (:username => "skittles123", :password => "iluvskittles", :balance => 1000)

	end 

	def self.is_logged_in?(session)
		!!session[:user_id]
	end 
end