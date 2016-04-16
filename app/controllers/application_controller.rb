require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  #include Helpers

  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params["username"])
  
    if @user != nil || @user != ""
      session[:user_id] = @user.id 
      redirect '/account'
    else
      redirect '/error'
    end
  end

  get '/account' do
    @id = session[:id]
    @user = User.current_user(session[:id])# != nil ? @user = User.current_user(session[:id]) : nil
    #@user.is_logged_in?(session[:id]) ? @current_user = @user : nil
  end

  get '/logout' do

  end


end

