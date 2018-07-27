class Helpers

  def self.current_user(session)
    @user = User.find_by(user_id: params[:user_id])
  end

  def self.is_logged_in?(session)
    @user = User.find_by(user_id: params[:user_id])
    !!@user
  end
end
