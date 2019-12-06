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
    @current_user = User.find_by(:username => params[:username])
    if @current_user 
      session[:user_id] = @current_user.id 
      redirect '/account'
    else 
      erb :error 
    end
  end

  get '/account' do
    @current_user = User.find_by_id(session[:user_id])
    erb :account
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end

