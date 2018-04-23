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
      if User.find_by(username: params[:username])
        session[:user_id] = User.find_by(username: params[:username]).id
        redirect to '/account'
      else
        erb :error
      end
  end


  get '/account' do
    if Helpers.is_logged_in?(session)
    @user = User.find_by(id: session[:user_id])
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
