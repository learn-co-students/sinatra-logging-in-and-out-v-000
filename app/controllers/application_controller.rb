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
  #find the user in the database based on their username.
  @user = User.find_by(username: params[:username], password: params[:password])
  #If there is a match, set the session to the user's ID, redirect them to the /account route (using redirect to)
    if @user && !@user.id.nil?
      #sets session[:user_id] equal to id of the user
      session[:user_id] = @user.id
      redirect ("/account"), 302
    else
    #If there is no match, render the error page.
      erb :error
    end
  end

  get '/account' do
    @user = Helpers.current_user(session) if Helpers.is_logged_in?(session)
    if @user
      erb :account
    else
      erb :error
    end
  end

  get '/logout' do
    session.clear
    redirect ("/")
  end


end
