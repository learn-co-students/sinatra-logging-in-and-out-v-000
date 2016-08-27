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
    @user = User.new(username: params[:username], password: params[:password])
    @username = User.find_by(username: params[:username])
    if @username
      session[:id] = @user.id
      redirect '/account'
    end
  end

  get '/account' do

  end

  get '/logout' do

  end


end
