class Helpers

  def self.current_user(session)
    @current_user = User.find_by(id: session[:user_id])
  end

  def self.is_logged_in?(session)
    @user = User.find_by(id: session[:user_id])
    !!@user
  end
end
