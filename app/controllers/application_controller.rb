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
    if @user = User.find_by(username: params["username"])
      session[:user_id] = @user.id
      #add the user id to the session
      redirect '/account'
    else
      erb :error
    end
  end

  get '/account' do
    # Checks that you have a session to see the account
    Helpers.is_logged_in?(session) ? (erb :account) : (erb :error)
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
