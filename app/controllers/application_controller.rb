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
    @user = User.find_by(username: params["username"], password: params[:password])
    if !@user.nil?
      session[:user_id] = @user.id
      redirect to '/account'
    end
    # if we get here, there was no match
    erb :error
  end
  
  get '/logout' do
    session.clear
    redirect to '/'
  end

  get '/account' do
    @cur_user = User.find_by(id: session[:user_id])
    if @cur_user != nil
      erb :account
    else
      erb :error
    end
  end

  
  get '/error' do
    erb :error
  end


end

