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
    @user = User.find_by(username: params[:username])
    if @user != nil && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect to '/account'
    else
      erb :error
    end
  end

  get '/account' do
    if session.include?("user_id")
      erb :account
    else
      erb :error
    end
    # can also do:
    # if Helpers.is_logged_in?(session)
      # @current_user = Helpers.current_user(session)
      # erb :account
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end

