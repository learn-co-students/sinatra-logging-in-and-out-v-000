class Helpers

  def self.current_user(h)
    @user = User.find(h[:user_id])
    @user
  end

  def self.is_logged_in?(h)
    !!h[:user_id]
  end

end
