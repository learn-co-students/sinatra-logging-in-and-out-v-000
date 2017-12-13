require_relative '../../config/environment'
require 'sinatra'

class ApplicationController < Sinatra::Base

  configure do
    #ask for explanation on this 
    set :public_folder, 'public'
    set :views, 'app/views'
    # set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do 
    @user = User.find_by(:username => params[:username])
  
    if @user != nil && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect to '/account'
      end 
      erb :error
  end


  get '/account' do
    @current_user = User.find_by_id(session[:user_id])
    if @current_user
        erb :account
    else
      erb :error
#understand? 
    end 
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end
end
    # if @user != nil && @user.password == params[:password]
# 
