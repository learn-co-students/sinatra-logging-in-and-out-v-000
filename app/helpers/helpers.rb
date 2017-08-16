class Helpers
  def current_user(session)
    User.find(session)
  end

  def is_logged_in?(session)
  end
end
