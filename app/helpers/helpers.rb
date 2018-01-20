require 'pry'
class Helpers <

  def self.current_user(session)
    User.all.find(session[:user_id])
  end

  # current_user should accept the session hash as an argument.
  # This method should use the user_id from the session hash to find the user in the database and return that user.

  def self.is_logged_in?(session)
    if session.include(user.id)
      return true
    else
      return false
    end
  end
  # is_logged_in? should also accept the session hash as an argument.
  # This method should return true if the user_id is in the session hash and false if not.
  # The Ruby !! operator will come in handy here.

end
