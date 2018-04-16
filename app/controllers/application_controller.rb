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
    @user = User.find_by(username: params[:username])
    if @user
    session[:user_id] = @user.id
    redirect '/account'
  else
    erb :error #renders error page
  end
end

  get '/account' do
    if !session[:user_id]
      erb :error #shows error page if user goes to directly to /account
    else
      erb :account #displays account information is user is logged in
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end


end
