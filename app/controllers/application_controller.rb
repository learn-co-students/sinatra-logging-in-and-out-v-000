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
    session[:user_id] = User.find_by(username: params[:username], password: params[:password]).id
    if session[:user_id] == nil
      redirect '/error'
    else
      redirect '/account'
    end
  end

  get '/account' do
    if Helpers.is_logged_in(session) == false
      redirect '/error'
    end
    erb :account
  end


  get '/logout' do
   session.clear
   redirect '/'
  end


end
