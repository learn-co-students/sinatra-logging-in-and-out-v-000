require 'pry'
class Helpers
  def self.current_user(session)
    @user = User.find_by(id: session[:user_id]) #uses users table connected to the User model and uses CRUD to look through the table
    @user
  end

  def self.is_logged_in?(session)
    !!User.find_by(id: session[:user_id]) ? true : false # looks to session to find the id in the session since it should have been saved in app controller
  end
end
