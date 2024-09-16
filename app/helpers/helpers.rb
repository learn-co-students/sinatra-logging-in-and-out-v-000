class Helpers

  def self.current_user(sessions)
    @real_user = User.find_by(sessions[:user_id])
  end

  def self.is_logged_in?(sessions)
    !!sessions[:user_id]
  end

end
