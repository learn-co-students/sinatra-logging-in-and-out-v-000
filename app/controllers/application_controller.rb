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
    @user_id = User.find_by(username: params["username"])
    # @user = User.find_by(:username => params[:username])
    if @user != nil && user.password == params[:password]
      session[:user_id] = @user_id
      redirect '/account'
    end
    erb :error
  end

  get '/account' do

  end

  get '/logout' do
    session.clear
  end


end
