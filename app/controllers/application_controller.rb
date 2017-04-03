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
    if @user = User.find_by(username: params["username"], password: params["password"]) #if match
      session[:user_id] = @user.id                        #set session[user_id] to @user.id
      redirect to '/account'
    else
      erb :error
    end
  end

  get '/account' do
    Helpers.is_logged_in?(session) ? (erb :account) : (erb :error) #needed (session) here
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end

end
