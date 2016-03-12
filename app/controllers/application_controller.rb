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
    @user= User.find_by(username: params["username"])
    if @user[:password]==params[:password]
      session[:id]=@user.id
      redirect to '/account'
    else
      redirect to '/error'
    end
    
  end

  get '/account' do
    erb :account
  end

  get '/logout' do
    session.clear
  end


end

