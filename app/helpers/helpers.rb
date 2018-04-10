class Helpers

  def self.current_user(session)# accepts the session hash as an argument
    @user = User.find(session[:user_id])
    # uses the user_id from the session hash to find the user in the database and return that user
  end

  def self.is_logged_in?(session) #accepts the session hash as an argument
    !!session[:user_id]
    #returns true if the user_id is in the session hash and false if not
  end
end
