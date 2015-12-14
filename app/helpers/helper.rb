class Helper

  def self.current_user (hash)
    User.find_by(id: hash["user_id"])
  end

  def self.is_logged_in? (hash)
    !!hash["user_id"]
  end

end