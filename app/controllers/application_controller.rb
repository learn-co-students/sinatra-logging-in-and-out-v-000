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
  #  puts params
    # @user = User.find_by(username: params["username"])
    # if User.find_by(username: params["username"], password: params["password"])
    #   session[:user_id] = @user.id
    #   redirect to '/account'

    @user = User.find_by(:username => params[:username])

    if @user != nil && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect to '/account'
    end
    erb :error
  end

  get '/account' do
    # from solution:
    # @current_user = User.find_by_id(session[:user_id])
    # if @current_user
    #  erb :account
    if Helpers.is_logged_in?(session)
      erb :account
    else
      erb :error
    end

  end

  get '/logout' do
    session.clear
  end


end
