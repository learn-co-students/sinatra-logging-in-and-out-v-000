class Helpers
  def self.is_logged_in?(info)
    !!info[:user_id]
  end
  def self.current_user(info)
    @user = User.find(info[:user_id])
  end
end