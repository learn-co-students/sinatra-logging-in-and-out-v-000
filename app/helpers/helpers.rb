class Helpers

  def self.current_user(session_info)
    @user = User.find(session_info[:user_id])
  end

  def self.is_logged_in?(session_info)
    if session_info[:user_id] != nil
      true
    else
      false
    end
  end

end
