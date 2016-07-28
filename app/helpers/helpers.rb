class Helpers
  def self.current_user(argument)
    @user = User.find_by(id: argument["user_id"])
  end

  def self.is_logged_in?(session)

  end
end
