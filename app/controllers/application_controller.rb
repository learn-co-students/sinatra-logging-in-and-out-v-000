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
<<<<<<< HEAD
    puts params
      if User.find_by(params[:email])
        session[:user_id] = User.find_by(params[:email]).id
        @user = User.find_by(params[:email])
        redirect to '/account'
      else
        redirect to '/'

      end
=======
    
    redirect './views/account'
>>>>>>> 9e36ad970499b1105e20adc25276212f4bcf48c8
  end


  get '/account' do
    @user = User.find_by(params[:email])
    erb :account

  end

  get '/logout' do

  end


end
