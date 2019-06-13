class Helpers < ActiveRecord::Base
  
  def self.current_user(session)
    @user = User.find(session[:user_id])
    
    @user
  end

  def self.is_logged_in?(session)
     !session[:user_id].nil?
  end
end