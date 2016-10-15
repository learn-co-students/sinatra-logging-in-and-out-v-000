class Helpers

  def self.current_user(session)
    return User.find(session[:user_id])
    binding.pry
  end

  def self.is_logged_in?(session)
    session.include?(:user_id)
  end

end
