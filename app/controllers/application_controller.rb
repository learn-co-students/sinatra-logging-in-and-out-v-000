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
    session[:user_id] = User.find_by(username: params[:username], password: params[:password])
    if session[:user_id].nil?
      erb :error
    else 
      redirect '/account'
    end
  end

  get '/account' do
    @user = User.find(session[:user_id])
    erb :account
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end

