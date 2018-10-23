class Helpers

  def self.current_user(ses_hash)
    User.find(ses_hash[:user_id])
  end

  def self.is_logged_in?(ses_hash)
    ses_hash[:user_id] != nil
  end
end
