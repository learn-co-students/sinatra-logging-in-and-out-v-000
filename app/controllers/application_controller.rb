require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params["user_name"], password: params["password"])

    if @user
      session[:user_id] = @user.id
      redirect to '/account'
    else
      redirect to '/error'
    end

  end

  get '/account' do
    @current_user = Helpers.current_user(session) #returns the user instance
    @status = Helpers.is_logged_in?(session) #returns true or false
    erb :account #renders views/account.erb
  end

  get '/error' do
    erb :error
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end

end

