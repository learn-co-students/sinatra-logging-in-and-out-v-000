class Helpers

  def self.current_user(user_id)
    User.find_by(id: user_id.values)
  end

  def self.is_logged_in?(user_id)
    User.find_by(id: user_id.values) ? true : false
  end
  
end