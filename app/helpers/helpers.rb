require 'pry'
class Helpers

  def self.current_user(session)
    @user = User.find_by(id: session[:user_id])
    @user
  end

  def self.is_logged_in?(session)
    @user = User.find_by(id: session[:user_id])

    if @user == nil
      false
    else
      true
    end
  end
end
