class Helpers

  def self.current_user(sesh)
    @user = User.find_by(id: sesh["user_id"])
  end

  def self.is_logged_in?(sesh)
    !!sesh["user_id"]
  end

end