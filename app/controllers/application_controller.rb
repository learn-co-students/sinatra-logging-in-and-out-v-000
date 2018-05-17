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
    puts "post login -> #{params}"
    @user = User.create(params)
    session[:user_id] = @user.id
    redirect to '/account'
  end

  get '/account' do
    @user = User.find(session[:user_id])
    @session = session
    if @user
      erb :account
    else
      erb :error
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
