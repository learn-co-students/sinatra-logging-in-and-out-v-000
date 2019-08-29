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
    @user = User.find_by(username: params[:username]) 
    if @user 
      if @user.password == params[:password]
        session[:user_id] = @user.id 
        redirect to :account
      else
        erb :error
      end
    else
      erb :error  
    end 
  end

  get '/account' do
    if User.find_by_id(session[:user_id])
      # Helpers.current_user(session)
      erb :account
    else 
      erb :error
    end
  end

  get '/error' do
    erb :error
  end

  get '/logout' do
    #  binding.pry 
    session.clear
    redirect to '/'
  end


end

