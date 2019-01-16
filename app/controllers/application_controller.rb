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
    @user = User.find_by(username: params["username"])

    if @user
      session[:user_id] = @user.id

      redirect to '/account'
      # Redirect automatically stops the rest from executing
    end
    erb :error
  end

  get '/account' do
    if session[:user_id]
      erb :account
    else
      erb :error
    end
    # Need if else statement when dealing with two erb files
  end

  get '/logout' do
    session.clear

    redirect to '/'
  end


end

