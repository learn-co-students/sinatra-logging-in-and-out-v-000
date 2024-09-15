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
    #find if user is in db based on username
    user = User.find_by username: params[:username], password: params[:password] 
    if user.nil?
      erb :error 
    else 
      #set session[id] to user.id 
      session[:user_id] = user.id 
      redirect '/account'
    end
  end

  get '/account' do
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      erb :account
    else 
      erb :error
    end 
  end

  get '/logout' do
    session.clear 
    
    redirect '/'
  end


end

