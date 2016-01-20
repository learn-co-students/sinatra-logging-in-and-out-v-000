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
    if User.exists?(username: params[:username], password: params[:password])
      @current_user=User.find_by(username: params[:username], password: params[:password])
      session[:user_id]=@current_user.id
      redirect to '/account'
    else
     erb :error
    end
  end

  post '/account' do
    #@user=User.find(params[:user_id])
    erb :account
  end

  get '/account' do
    if Helpers.user_valid?(session)
      @user=Helpers.current_user(session)
      erb :account
    else
      erb :error
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end

  post '/error' do
    erb :error
  end




end

