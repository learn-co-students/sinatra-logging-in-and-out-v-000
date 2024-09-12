class Helpers

  def self.current_user(hash)
    @user = User.find_by(id: hash[:user_id])
  end

  def self.is_logged_in?(session)
    !!self.current_user(session)
  end

end
