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

    (session[:user_id] = @user.id) && (redirect to '/account') if !@user.nil?

    erb :error
  end

  get '/account' do
    @user = session

    @user[:user_id] ? (erb :account) : (erb :error)
  end

  get '/logout' do
    session.clear

    redirect to '/'
  end

  get '/error' do
    erb :error
  end
end
