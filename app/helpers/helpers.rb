class Helpers < ActiveRecord::Base

  def self.current_user(session)
    User.find_by_id(session[:user_id])
  end

  def self.is_logged_in?(session)
    
    if User.find_by_id(session[:user_id]) == nil
      false
    else
      true
    end
  end

end
