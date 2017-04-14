class Helpers

  def self.current_user(session)
    @user = User.find_by_id(session[:user_id])
    if @user.is_a?(User)
         @user    
    end
  end

  def self.is_logged_in?(session)
  !!User.find_by_id(session[:user_id])
  end
end
