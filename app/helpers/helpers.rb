require 'sinatra/base'


#note the session is not active here, only active in the account.erb file because our controller provides the session hash access to that file only
class Helpers

  def self.current_user(session_hash)
    User.find(session_hash[:user_id])
      #this block uses the session has and returns the user_id within that hash
  end
  def self.is_logged_in?(session_info)
    !!session_info[:user_id]  #this code is saying, if the hash contains a user_id, than the statement is true.  If a user_id cannot be found in the hash than it will yield false

  end
end


#These two methods will only ever be called in views, particularly account.erb, in order to add double protection to this view so that only the current user, when they are logged in, can see their bank account balance.
