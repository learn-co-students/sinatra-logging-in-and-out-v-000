require_relative '../../config/environment'
require 'sinatra'

class ApplicationController < Sinatra::Base

  configure do
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
    
    
    @user = User.find_by("username" => params[:username])
     
    if @user != nil and @user.password == params[:password]
      sesssion[:user_id] = @user.id
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
    end 
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end


end

