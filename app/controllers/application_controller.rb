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
    user = User.find_by(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect to '/account'
    end
    erb :error
  end

  get '/account' do
    if Helpers.is_logged_in?(session)
      binding.pry
      @user = Helpers.current_user(session)
      binding.pry
      erb :account
      binding.pry
    #else
      #erb :error
    end
    binding.pry
    erb :error
    #-------------Previous code that doesn't completely work----------
    #if Helpers.is_logged_in?(session)
    #binding.pry
      #@session = session
      #erb :account
    #else
     # erb :error
    #end
    #erb :error
  end

  get '/logout' do
    session.clear
    redirect "/"
  end


end

