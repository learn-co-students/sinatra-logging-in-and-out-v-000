class Helpers
  #current_user should accept the session hash as an argument.
  def self.current_user(session)
    #This method should use the user_id from the session hash to find the user in the database and return that user.
    User.find(session["user_id"])
  end

  #is_logged_in? should also accept the session hash as an argument.
  def self.is_logged_in?(session)
    #This method should return true if the user_id is in the session hash and false if not.
    if user_id == (session)

    else

    #The Ruby !! operator will come in handy here.
    end
  end
end
