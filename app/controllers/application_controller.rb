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
    if User.find_by(username: params["username"], password: params["password"]) 
      @user = User.find_by(username: params["username"], password: params["password"])
      session[:user_id] = @user.id
      redirect to '/account'
    else 
      erb :error
    end
  end

  get '/account' do 
    if session[:user_id] == nil
      erb :error
    else
      erb :account
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end


end

