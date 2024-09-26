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
    @user = User.find_by(username: params[:username], password: params[:password])

    if @user
      session[:user_id] = @user.id
      redirect '/account', 302
    else
      erb :error
    end
  end

  get '/account' do
    if !session.key?("user_id")
      erb :error
    else
      @user = Helpers.current_user(session)
      @logged_in = Helpers.is_logged_in?(session)
      erb :account
    end
  end

  get '/logout' do
    session.clear
    redirect to('/')
  end

end
