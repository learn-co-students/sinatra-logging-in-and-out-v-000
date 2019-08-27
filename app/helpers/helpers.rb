class Helpers

  def self.current_user(session)
    User.find_by(id: session[:user_id])
  end

  def self.is_logged_in?(session)
    self.current_user(session).id == session[:user_id]
    ### ALTERNATIVE SOLUTION ###
    # !!session[:user_id]
    # => if user is logged out, session hash is empty,
    # => !session[:user_id] returns the opposite boolean value of  the return value of session[:user_id] (if session[:user_id] returns 'nil' then ! operator returns true)
    # => !! returs the opposite boolean value of above
  end


end
