require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

#####GET '/'
#returns a 200 status code
#contains a form for a user to log in
  get '/' do
    erb :index
  end

#####POST '/login'
#returns a 302 redirect status code
#sets session[:user_id] equal to id of the user
#displays the correct username based on session[:user_id]
#displays the correct balance based on session[:user_id]
#displays a 'Log Out' link
#shows the error page if username and ID do not match available users
  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.password == params[:password]
      session[:user_id] = @user.id
      redirect to "/account"
    else
      erb :error
    end
  end

#####GET '/account'
#shows the error page if user goes directly to /account
#displays the account information if a user is logged in
  get '/account' do
    if User.find_by(id: session[:user_id])
      erb :account
    else
      erb :error
    end
  end

#####GET '/logout'
#clears the session
#redirects to '/'
  get '/logout' do
    session.clear
    redirect to "/"
  end


end
