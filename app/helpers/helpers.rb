class Helpers

  def self.current_user

  end
  def self.is_logged_in?

  end
end


#These two methods will only ever be called in views, particularly account.erb, in order to add double protection to this view so that only the current user, when they are logged in, can see their bank account balance.
