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
    @user = User.find_by(email: params[:email])
    if @user
      session[:user_id] = @user.id
      redirect to "/account"
    else 
      erb :error
      #@user = User.find_by(email: params[:email], password: params[:password])
    end
  end

  get '/account' do
    erb :account
  end

  get '/logout' do

  end


end

