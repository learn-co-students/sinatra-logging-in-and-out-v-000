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
    @user = User.find_by(params)
    if !@user
      erb :error
    else
      session[:user_id] = @user.id
      redirect to '/account'
      
      erb :account
    end
  end

  get '/account' do
    if !Helpers.is_logged_in?(session)
      erb :error
    else
      erb :account
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end


end

