class Helpers

  def self.current_user(session)
    User.all.each {|u| puts u.username}
    User.find(session[:user_id])
  end

  def self.is_logged_in?(session)
    !!session[:user_id]
  end

end