require_relative '../../config/environment'
require 'pry'
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
    # You'll need to create a login form on the index page that accepts a username and password and sends a POST request with an action of /login
    @user = User.find_by(username: params[:username], password: params[:password])
     if @user
       session[:user_id] = @user.id
       redirect '/account'
     else
       erb :error
     end
  end

  get '/account' do
    @user = User.find_by_id(session[:user_id])

    if @user
      erb :account
    else
      erb :error
    end
  end

  get '/logout' do
    session.clear

    redirect '/'
  end


end
