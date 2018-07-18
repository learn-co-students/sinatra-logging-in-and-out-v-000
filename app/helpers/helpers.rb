class Helpers < ActiveRecord::Base

  def self.current_user
    @user = User.create(username: params["name"], password: params["password"], balance: params["balance"])
    @user.id = session[:user_id]
  end

  def self.is_logged_in?
  end

end