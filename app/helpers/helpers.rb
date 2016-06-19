class Helpers

  def self.current_user(session)
    User.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    if !session.include?(:user_id)
      false
    elsif session.include?(:user_id)
      true
    end
  end
end