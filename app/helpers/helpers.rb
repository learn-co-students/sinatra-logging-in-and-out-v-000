class Helpers
#These 2 methods will be called in account.erb
  def self.current_user(session)
    @user = User.find_by_id(session[:user_id])
    # @user_id
  end

  def self.is_logged_in?





  end



end
