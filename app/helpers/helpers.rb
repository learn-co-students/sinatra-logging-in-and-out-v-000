class Helpers

  def self.current_user(session_hash)   #get all user info from data base using session user id
     @user = User.find(session_hash[:user_id])
  end
  def self.is_logged_in?(session_hash)    #verified that the user who log on is the same save in the session.
     !!session_hash[:user_id]
  end
end
#this methods are used in the views instead of use the variables @user, etc directly.
