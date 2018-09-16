class ApplicationController < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(:username => params[:username])
<<<<<<< HEAD
    if @user != nil && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect to '/account'
    end
    erb :error
  end

  get '/account' do
    @current_user = User.find_by_id(session[:user_id])
=======
    if @user!=nil  && @user.password = params[:password]
    session[:user_id] = @user.id
    redirect to '/account'
  end
  erb :error
  end

  get '/account' do
    puts "#{session[:user_id]}"
    @current_user = User.find_by(session[:user_id])
>>>>>>> ce40d21910e8c575d98bc85c480e56dee0f6ba79
    if @current_user
      erb :account
    else
      erb :error
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end
end
