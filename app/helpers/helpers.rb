class Helpers
  def self.current_user(session_hash)
    @user = User.find(session[:id])
    @user
    binding.pry
  end

  def self.is_logged_in?
  end
end
