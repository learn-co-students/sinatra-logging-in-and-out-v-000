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
    @user = Users.find_by(username: params[:username], password: params[:password], balance: params[:balance])
    binding.pry
    if @user
      session[:user_id] = @user.id
      redirect to '/account'
    end
    erb :error
  end

  get '/account' do
    if !Helpers.is_logged_in?(sessions)
      erb :error
    end
    Helpers.current_user(session)
  end

  get '/logout' do
    session.clear
    redirct to '/'
  end


end
