class Helpers
  def self.current_user(session)
    current_user = User.find_by(id: session["id"])
    current_user
  end

  def is_logged_in?(session)
  end
end
