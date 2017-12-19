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
     #binding.pry
    
    if User.find_by(:username => params[:username]) == nil 
      #binding.pry
      erb :error 
    else 
      @user = User.find_by(:username => params[:username])
      
      session[:user_id] = @user.id 
      #binding.pry
      redirect to '/account'
    end 
  end

  get '/account' do
      #binding.pry
      if session[:user_id] == nil 
        erb :error 
      else 
        @user = User.find(session[:user_id])
        erb :account
      end 
  end

  get '/logout' do
    session.clear 
    redirect to '/'
  end


end

