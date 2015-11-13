require_relative 'config/environment'
class App < Sinatra::Base
  configure do
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    User.all.each do |user|
      if user.username == params[:username] && user.password == params[:password]
        session[:id] = user.id
        redirect to '/account'
      end
    end
    erb :error
  end

  get '/account' do
    @current_user = User.all.select { |user| user.id == session[:id]}.first
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

#Add an array of hashes with usernames/passwords
#Hashes with 
