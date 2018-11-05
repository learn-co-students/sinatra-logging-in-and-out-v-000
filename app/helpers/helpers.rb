require 'pry'

class Helpers < ApplicationController

  def self.is_logged_in?(session)
  #  if session[:usernam].empty?
  #    redirect "/index"
    !!session[:user_id]
  end

  def self.current_user(session)
    @user = User.find_by(:id => session[:user_id]) if session[:user_id]
  end

  def logout
    session.clear
  end

end
