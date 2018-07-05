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
    @user = User.find_by(username: params['username'])
    #binding.pry
    if !@user
      erb :error
    elsif !(@user.password == params[:password])
      erb :error
    else
      session[:user_id] = @user.id
      #@session = session
      redirect to '/account'
    end
  end

  get '/account' do
    #binding.pry
    if !!session[:user_id]
      @current_user = Helpers.current_user(session)
      @logged_in = Helpers.is_logged_in?(session)
        if @current_user && @logged_in
            erb :account
        else
          erb :error
        end
    else
      erb :error
    end
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end


end
