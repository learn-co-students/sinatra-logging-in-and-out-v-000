class Helpers
  def self.current_user(session_hash) #This method should use the user_id from the session hash to find the user in the database and return that user.
    @user = User.find_by_id(session_hash[:user_id])
  end

  def self.is_logged_in?(session_hash)  #This method should return true if the user_id is in the session hash and false if not.
    # !!(self.current_user(session_hash))
    !!session_hash[:user_id]
  end
end
