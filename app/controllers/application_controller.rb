require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    # binding.pry
    @user = User.find_by(:username => params[:username])
    if @user
      session[:user_id] = @user.id
      redirect to '/account'
    else
      erb :error
    end

  end

  get '/error' do
    erb :error
  end

  get '/account' do
  #  binding.pry
   if session[:user_id]
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
