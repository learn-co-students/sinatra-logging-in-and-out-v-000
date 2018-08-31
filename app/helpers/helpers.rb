class Helpers
  
  def
    User.find(session[:user_id])
  end
  
  def 
    !!session[:user_id]
end