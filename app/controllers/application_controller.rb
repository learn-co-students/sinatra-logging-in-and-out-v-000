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
    puts params
    if User.find_by(username: params["username"])
      @user = User.find_by(username: params["username"])
      session[:user_id] = @user.id
      redirect to :account
    else
      erb :error
    end
  end

  get '/account' do

  end

  get '/logout' do
    session.clear
    redirect to '/'

  end


end
