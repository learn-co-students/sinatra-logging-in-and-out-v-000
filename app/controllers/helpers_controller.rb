require_relative 'application_controller'

class HelpersController < ApplicationController

  def self.current_user
    binding.pry
    @user = User.find_by_id(session[:user_id])
  end

  def self.is_logged_in?
    !!session[:user_id]
  end

end