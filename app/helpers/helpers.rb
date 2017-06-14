class Helpers

	def self.current_user(session)
    @user = User.find_by(id: session[:id])
	end

	def self.is_logged_in?(session)
    !!session[:id]
	end

end
