class Helpers
#These 2 methods will be called in account.erb
  def current_user([session: user_id])
  session :params[@user_id]
  @user_id.find_by([@user_id])
    @user_id

  end



  def is_logged_in?





  end



end
