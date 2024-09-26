class Helpers

  def self.current_user(session)
    #use the user_id from the session hash to find the user in the db & return that user
    @user = User.find_by_id(session[:user_id])
  end

  def self.is_logged_in?(session)
    #return true if the user_id is in the session hash, false if not
    !!session[:user_id]
  end
end
