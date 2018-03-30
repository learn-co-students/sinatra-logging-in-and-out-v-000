require 'pry'
class Helpers
  def self.current_user(session)
    @user = User.find_by(id: session[:user_id])
    #binding.pry
    @user
  end

  def self.is_logged_in?(session)
    !!session[:user_id]
  end

end
=begin
def self.is_logged_in?(session)
  @user = User.find_by(id: session[:user_id])
  if @user
    @user.id == session[:user_id] ? true : false
  end
end
=end
