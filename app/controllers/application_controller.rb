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
    if(User.exists?(:username => params[:username]))
      @users = User.where(:username => params[:username])
      session[:user_id] = @users.first.id
      #binding.pry
      redirect '/account'
    else
      erb :error
    end
  end

  get '/account' do
    if(Helpers.is_logged_in?(session))
      erb :account
    else
      #binding.pry
      erb :error
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
