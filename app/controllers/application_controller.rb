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
    username = params['username']
    password = params['password']
    user = User.find_by(username: username, password: password)
    if user
      session[:user_id] = user.id
      redirect to "/account"
    else
      erb :error
    end
  end

  get '/account' do
    if Helpers.is_logged_in?(session)
      erb :account
    else
      erb :error
    end
  end

  get '/logout' do
    session.clear
    redirect to "/"
  end


end
