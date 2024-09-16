class Helpers

  def self.current_user(params)
    User.find(params[:user_id])
  end

  def self.is_logged_in?(params)
    if current_user(params)
      true
    else
      false
    end
  end

end
