class Helpers
  def self.current_user(session)
    @user = User.find_by(id: session[:user_id])

  end
  def self.is_logged_in?(session)
    !!session[:user_id]
  end
end

#
# current_user should accept an argument, which is the session hash. This method should use the user_id from the session hash to find the user in the database and return that user.
# is_logged_in? should also accept the session hash as an argument. This method should return true if the user_id is in the session hash and false if not. The Ruby !! will come in handy here.
