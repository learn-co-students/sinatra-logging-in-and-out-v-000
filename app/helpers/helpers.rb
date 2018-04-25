class Helpers
  def self.current_user(session)
    # current_user should accept the session hash as an argument.
    # This method should use the user_id from the session hash
    # to find the user in the database and return that user.

    user = User.find(session[:user_id])
    return user
  end

  def self.is_logged_in?(session)
    # is_logged_in? should also accept the session hash as an argument.
    # This method should return true if the user_id is in the session hash
    # and false if not. The Ruby !! operator will come in handy here.

    if !!session[:user_id]
      true
    else
      false
    end
  end
end
