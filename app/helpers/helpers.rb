class Helpers

  def self.current_user(arg)
    @user = User.find(arg[:id])

  end

  def self.is_logged_in?(arg)
    @user = User.find(arg[:id])
    !!@user
  end
  
end