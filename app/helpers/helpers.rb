require 'pry'
class Helpers
  def self.current_user(sessName)
      @user = User.find(sessName[:user_id])
      @user
  end
  
  def self.is_logged_in?(sessName)
    if sessName[:user_id].nil?
      false
    else
      true
    end
  end
end