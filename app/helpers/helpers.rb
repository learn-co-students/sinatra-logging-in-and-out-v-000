class Helpers

  def self.current_user(session)
    @user = User.find_by(session[:id])
  end 
  
  def self.is_logged_in?(session)
    !!User.find_by(session[:id])
  end
  
end