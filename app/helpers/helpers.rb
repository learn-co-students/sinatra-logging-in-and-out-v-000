class Helpers

  def self.current_user(current_session)
    @user = User.find_by(id: current_session[:user_id])
    @user
  end

  def self.is_logged_in?(current_session)
    !!current_user(current_session)
  end

end
