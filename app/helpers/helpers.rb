class Helpers

  def self.current_user(session_hash)
    @user = User.find_by(id: session_hash[:user_id])
    @user
  end

  def self.is_logged_in?(session_hash)
    #binding.pry
    @user = User.find_by(id: session_hash[:user_id])
    if @user.id == session_hash[:user_id]
      !!@user.id
    end
  end

end
