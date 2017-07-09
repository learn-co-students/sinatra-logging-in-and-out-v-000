class Helpers
  def self.current_user(hash)
      @user = User.find_by(id: hash[:user_id])
      @user
  end

  def self.is_logged_in?(hash)
    @user = Helpers.current_user(hash)

    @user.id == hash[:user_id]
  end

end
