require 'pry'

class Helpers
  def self.current_user(hash)

    User.find(hash[:user_id])
  end

  def self.is_logged_in?(hash)

    !!User.find_by_id(hash[:user_id])
  end

end