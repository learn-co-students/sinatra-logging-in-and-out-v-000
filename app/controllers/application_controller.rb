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
    puts params
    # session = User.new(username: params[:username], password: params[:password])
     @user = User.find_by(username: params[:username])
    # @user_login_info = Helpers.current_user(params)
    # binding.pry
    if @user
      session[:user_id] = @user.id
      redirect '/account'
      erb :account
    end
  end

  get '/account' do

  end

  get '/logout' do

  end


end
