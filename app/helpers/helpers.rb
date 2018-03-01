class Helpers
  def self.current_user(s)
    User.find(s[:user_id])
  end

  def self.is_logged_in?(s)
    # !!current_user
    s.include?(:user_id)
  end
end
