require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    # User.create(username: "anytimesoon", password: "password", balance: 100.00)
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if !!@user && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect to('/account'), 302
    else
      erb :error
    end
  end

  get '/account' do
    if Helpers.is_logged_in?(session)
      # binding.pry
      erb :account
    else
      erb :error
    end
  end

  get '/logout' do
    session.clear
    redirect to('/'), 302
  end


end
