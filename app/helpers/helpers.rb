class Helpers

  def self.current_user(session)
    @user = User.find_by_id(session[:user_id])
    @user
  end

  def self.is_logged_in?(session)
    #the '!!' double bang converts object into a truthy value statement
    !!session[:user_id]
  end
end