class Helpers

  def self.current_user(user)
    user_id = user[:user_id]
    User.find(user_id)
  end

  def self.is_logged_in?(user)
    if self.current_user(user)
      true
    else
      false
    end
  end
end
