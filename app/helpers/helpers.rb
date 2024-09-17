class Helpers
  def self.current_user(session)
    @current_user = User.find_by(id: session[:user_id])
  end

  def self.is_logged_in?(session)
    # returns true if user_id is in session hash; false otherwise
    !!session[:user_id]
    # alternatively, !!@current_user
  end
end