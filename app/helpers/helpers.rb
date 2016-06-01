
class Helpers < ActiveRecord::Base
  def self.current_user(session)
    @user = User.new
    @user[:id] = session[:user_id]
    @user
  end

  def self.is_logged_in?(session)
    if session[:user_id] == @user[:id]
      true
    else
      false
    end
  end
end