require 'pry'

class Helpers
  def self.current_user(session)
    @user = User.find_by(id: session[:user_id])
  end
  #current_user should accept the session hash as an argument. "class method"
  #This method should use the user_id from the session hash,
  # to find the user in the database and return that user.

  def self.is_logged_in?(session)
    !!session[:user_id]
    # this is a bang bang boolean easy way to turn it make it boolean - Chris Alberti
  end
  #is_logged_in? should also accept the session hash as an argument.
  #This method should return true if the user_id is in the session hash and false if not.
  #The Ruby !! operator will come in handy here.


end
