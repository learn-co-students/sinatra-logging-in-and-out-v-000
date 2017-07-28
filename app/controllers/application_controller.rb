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
    if User.where(username: params[:username], password: params[:password])[0] == nil
      redirect '/error'
    else
    @user = User.where(username: params[:username], password: params[:password])[0]
    end
    session[:user_id] = @user.id
    redirect '/account'
  end

  get '/account' do
    if session[:user_id] != nil
      @user = User.find(session[:user_id])
    else
      redirect '/error'
    end
    erb :account
  end

  get '/error' do
    erb :error
  end

  get '/logout' do
      session.clear
      redirect '/'
  end


end
