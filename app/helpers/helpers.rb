class Helpers
  def current_user(session)
    @user = User.find_by(session[:id])
    @user
  end 
end