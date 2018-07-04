class Helpers

  def self.current_user(session_hash)
    @user = User.find_by(id: session_hash[:id])
    @user
  end

  def self.is_logged_in(session_hash)
    !!@user.id == session_hash[:id]
  end

end
