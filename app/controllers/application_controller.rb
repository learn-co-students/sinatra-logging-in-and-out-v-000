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
    @user = User.find_by(username: params["username"], password: params["password"])
    if @user.nil? == false
      #binding.pry
      session[:user_id] = @user.id
      @username = @user.username
      redirect '/account'
    else
      erb :error
    end

  end

  get '/account' do 
    if !session[:user_id].nil?
      @user = User.find(session[:user_id])
      erb :account
    else 
      erb :error
    end
  end

  get '/logout' do
    session.destroy
    redirect '/'
  end


end

