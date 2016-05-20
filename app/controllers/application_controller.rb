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
    @user = User.find_by(:username => params[:username])  #set @user to user who logs in
    if @user != nil #if user exists set session user_id and go to account ROUTE
      session[:user_id] = @user.id
      redirect to '/account' 
    else #else error page
      erb :error
    end
  end

  get '/account' do
    @current_user = User.find_by_id(session[:user_id]) #define current user
    if @current_user
      erb :account #if real go to account page
    else
      erb :error #else error page
    end
  end

  get '/logout' do
    session.clear
  end
end
