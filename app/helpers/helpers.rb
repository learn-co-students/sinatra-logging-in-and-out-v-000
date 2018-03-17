# Provides helper methods
class Helpers
  def self.current_user(params)
    User.find_by(id: params[:user_id])
  end

  def self.is_logged_in?(params)
    params.key?(:user_id)
  end
end
