class Helpers

  def self.current_user(arg)
    @user = User.find_by(id: arg[:user_id])
    @user
  end

  def self.is_logged_in?(arg)
    !!arg[:user_id]
  end
  
end