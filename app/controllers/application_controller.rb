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
    @user = User.find_by(username: params["username"], password: params["password"])
    session[:user_id] = @user.id if @user != nil
    if Helpers.is_logged_in?(session)
      redirect '/account'
    else
      erb :error
    end
  end

  get '/account' do
    if session[:user_id] != nil
      @user = User.find(session[:user_id])
      erb :account
    else
      erb :error
    end
  end

  post '/logout' do
    session.clear
    redirect '/'
  end


end
