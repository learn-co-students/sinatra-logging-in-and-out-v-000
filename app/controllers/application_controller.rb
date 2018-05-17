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
      @user = User.find_by('username' => params[:username])
    #   binding.pry
      if @user.password == params[:password]
          session[:user_id] = @user.id
        #   binding.pry
          redirect to '/account'
      else
          redirect to '/error'
      end
  end

  get '/account' do
    #   binding.pry
      @user = Helpers.current_user(session)
      if Helpers.is_logged_in?(session) && Helpers.current_user(session).id == session[:user_id]
        #   binding.pry
          erb :account
      elsif !Helpers.is_logged_in?(session)
          redirect to '/error'
      end
  end

  get '/error' do
      erb :error
  end

  get '/logout' do
      session.clear
      redirect to '/'
  end


end
