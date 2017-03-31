class Helpers #for use in account.erb
  def self.current_user(hash)
    User.find(hash[:user_id])
  end

  def self.is_logged_in?(hash)
    !!hash[:user_id]
  end
end
