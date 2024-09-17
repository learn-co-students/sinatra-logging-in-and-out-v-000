class Helpers
  def self.current_user h
    User.find(h[:user_id])
  end
  def self.is_logged_in? h
    h.key?(:user_id)
  end
end
