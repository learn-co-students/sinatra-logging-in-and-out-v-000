require_relative '../../config/environment'
require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
      # binding.pry
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params["username"], password: params["password"])

    if @user && @user.password == params[:password]
    session[:user_id] = @user.id

    # if @user
    # session[:user_id] = @user.id
    # @user.username = params[:username]
    # @user.password = params[:password]
    # @user.balance = params[:balance]
    redirect '/account'
  else
    erb :error
  end
  end

  get '/account' do

     @current_user = User.find_by_id(session[:user_id])
     if @current_user
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
