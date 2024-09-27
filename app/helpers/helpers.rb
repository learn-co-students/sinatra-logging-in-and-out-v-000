class Helpers

  def self.current_user(session)
    User.find_by(id: session[:user_id])
  end

  def self.is_logged_in?(session)
    # binding.pry
    session.has_key?(:user_id)
  end
end
