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
#	  binding.pry
	@user = User.find_by(username: params[:username]) 
	#	   binding.pry
	if @user.password == params[:password]
	  session[:user_id] = @user.id 
#		 binding.pry
	  @username = @user.username	
	  redirect to :account
	else
	  redirect to :error
	end
  end

  get '/account' do

  end

  get '/logout' do

  end


end

