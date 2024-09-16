require 'sinatra/base'

class Helpers
  def self.current_user(session)
    @user = User.find_by_id(session[:user_id])
  end

  def self.is_logged_in?(session)
    # User.find_by(session[:user_id]) ? true : false
    !!session[:user_id]
  end

  # def self.current_user_username(session)
  #   @user = User.find_by_id(session[:user_id])
  #   @user.username
  # end
  #
  # def self.current_user_balance(session)
  #   @user = User.find_by_id(session[:user_id])
  #   @user.balance.to_f
  # end
end
