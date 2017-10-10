class Helpers
  def self.current_user(session)
    User.find { |user| user["user_id"] == session["user_id"]}
  end

  def self.is_logged_in?(session)
    !!self.current_user(session)
  end

end
