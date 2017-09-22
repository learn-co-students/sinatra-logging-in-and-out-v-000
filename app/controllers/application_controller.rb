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
    # puts params
    @user = User.find_by(username: params[:username])

    if !@user.nil?
      session[:user_id] = @user.id
      redirect to '/account'
    else
      redirect to '/error'
    end
  end

  get '/account' do
    @user = User.find(session[:user_id])

    erb :account
  end

  get '/logout' do
    session.clear

    redirect to '/'
  end

  get '/error' do
    erb :error
  end
end
