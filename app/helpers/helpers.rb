class Helpers

  def self.current_user(session)
    @user = User.find_by_id(session["user_id"])
  end

  def self.is_logged_in?(session)
    !!session["user_id"]
    # if self.current_user(session).id == session["user_id"]
    #   true
    # else
    #   false
    # end
  end


end