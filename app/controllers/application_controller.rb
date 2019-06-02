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
  usergood = User.find{|user| user[:username] == params[:username]}
  if usergood !=nil && usergood.password == params[:password]

    session[:user_id] = usergood[:id]
    @session = session

    redirect to "/account"

  else
    erb :error
end
  end

  get '/account' do
    if session[:user_id] != nil
   erb :account
    else
   erb :error
 end
  end

  get '/logout' do
  session.clear
  redirect to "/"
  end


end
