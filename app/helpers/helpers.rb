class Helpers
  def self.current_user(session_info)
    @user = User.find_by_id(session_info[:user_id])
    @user
  end

  def self.is_logged_in?(session)
    !!current_user(session)
  end
end
