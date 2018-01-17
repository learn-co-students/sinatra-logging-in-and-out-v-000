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
    @user = User.find_by(:username => params[:username])
      if @user != nil && @user.password == params[:password]
        session[:user_id] = @user.id
        redirect to '/account'
    end 
    erb :error
  end
  
  get '/account' do
    @logged_in_user = User.find_by_id(session[:user_id])
    if @logged_in_user
      erb :account
    else
      erb :error
    end
  end

  # Why is @user nil?

  get '/logout' do
    session.clear
    redirect to '/'
  end
end

