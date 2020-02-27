require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  #==================== CONFIGURATION =====================
  #---------- Sessions #
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end
  #--------------------------------------------------------


  #==================== LOGIN =============================
  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params["username"])
    if @user
      session[:user_id] = @user.id
      redirect '/account'
    else
      erb :error
    end
  end

  get '/account' do
    @user = User.find_by(id: session[:user_id])
    if Helpers.is_logged_in?(session)
      erb :account
    else
      erb :error
    end
  end
  #--------------------------------------------------------


  #==================== LOGOUT ============================
  get '/logout' do
    session.clear
    redirect '/'
  end 
  #--------------------------------------------------------

end

