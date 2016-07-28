class Helpers
  def current_user(argument)
    User.find_by(id: argument["user_id"])
  end

  def is_logged_in?(session)
    
  end
end
