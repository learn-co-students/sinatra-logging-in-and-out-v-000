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
#In the controller action that processes the post request, you'll want to find the user in the database based on it's username.
#If there is a match, set the session to the user's id and redirect them to the /account route (using redirect to) and use ERB to display the user's data on the page.
#If not, render the error page.

 post '/login' do
    @user = User.find_by(username: params[:username])
    if !@user.nil?
      session[:user_id] = @user.id
      redirect to '/account'
    else
      erb :error
    end
  end

  get '/account' do
   @user = User.find_by_id(session["user_id"])
    if !@user.nil?
      erb :account
    else
      erb :error
    end
  end

  get '/logout' do
    session.clear
  end

  get '/error' do
    erb :error
  end
end


