class Helpers

  def self.current_user(session)
    @user = User.find_by_id(session[:user_id])
  end

  def self.is_logged_in?(session)
    # binding.pry
    # Helpers.current_user(session) ? true : false
    session[:user_id] ? true : false
  end
end
