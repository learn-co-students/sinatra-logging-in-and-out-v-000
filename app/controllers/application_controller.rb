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
    session[:user_id]
    @user = User.find_by(username: params["username"])
    #binding.pry
    if @user == nil
      erb :error
    elsif
      session[:user_id] = @user.id
      if @user.password == params[:password]
        redirect to '/account'
      end
    else
      erb :error
    end


  end

  get '/account' do
#binding.pry
  erb :account
#    if Helpers.is_logged_in?(session)
#      erb :account
#    else
#      erb :error
#    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

#Helpers.is_logged_in?(user_id: session[:user_id])
end
