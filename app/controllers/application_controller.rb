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
    # puts "post login -> #{params}"
    User.create(params)
    @user = User.find_by(username: params[:username])
    session[:user_id] = @user.id
    # puts "SET session user_id = #{session[:user_id]} || user_id = #{@user.id}"
    redirect to '/account'
  end

  get '/account' do
    # "GET session user_id = #{session[:user_id]}"
    if !session[:user_id] || !User.find(session[:user_id])
      erb :error
    else
      @user = User.find(session[:user_id])
      session[:user_id] = @user.id
      @session = session
      erb :account
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
