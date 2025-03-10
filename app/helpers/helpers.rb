class Helpers
  def self.current_user(session)
    # binding.pry
    @user = User.find_by(id: session[:user_id])
  end

  def self.is_logged_in?(session)
    session[:user_id].integer?
  end
end
