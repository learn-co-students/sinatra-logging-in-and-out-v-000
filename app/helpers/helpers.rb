require 'pry'
class Helpers
  def self.current_user(session)
    @user = User.find_by(id: session[:user_id])
    #binding.pry
    @user
  end

  def self.is_logged_in?(session)
    !!@user.id == session[:user_id]
  end
end
