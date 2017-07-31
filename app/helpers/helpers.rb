class Helpers < ApplicationController
  def self.current_user(user)
    @user = User.find_by(id: user[:user_id])
    @user
  end

  def self.is_logged_in?(user)
     !!user[:user_id]
  end

end
