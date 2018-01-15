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
    #	   binding.pry
    if @user.password == params[:password]
      session[:user_id] = @user.id 
  		
      redirect to :account
    else
      redirect to :error
    end
  end

  get '/account' do
    if Helpers.is_logged_in?(session)
      # Helpers.current_user(session)
      erb :account
    else 
      redirect to :error
    end
  end

  get '/logout' do
     binding.pry 
    session.clear
    erb :index
  end


end

