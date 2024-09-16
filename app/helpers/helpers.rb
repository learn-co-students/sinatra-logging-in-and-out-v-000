class Helpers < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end
  def self.current_user(session)
    user = User.find_by(id: session[:user_id])
  end

  def self.is_logged_in?(session)
    !!self.current_user(session)
  end
end
