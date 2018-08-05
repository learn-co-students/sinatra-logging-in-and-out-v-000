require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    disable :show_exceptions
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    @user = User.find_by(username: params[:username])
    if @user && @user.password == params[:password]
#       binding.pry
#       [1] pry(#<ApplicationController>)> @user
# => #<User:0x0000000434b760
#  id: 1,
#  username: "skittles123",
#  password: "iluvskittles",
#  balance: #<BigDecimal:24d2428,'0.1E4',9(27)>>
# [2] pry(#<ApplicationController>)> @user && @user.password == params[:password]
# => true
      session[:user_id] = @user.id
      session[:username] = @user.username
      session[:password] = @user.password
      # binding.pry
      # [1] pry(#<ApplicationController>)> @user
# => #<User:0x0000000518fdd0
#  id: 1,
#  username: "skittles123",
#  password: "iluvskittles",
#  balance: #<BigDecimal:32cab98,'0.1E4',9(27)>>
# [2] pry(#<ApplicationController>)> session
# => {"session_id"=>"5b9522d45e3da6f270d45dd3049d58ec6681466e4476c381f12b5b93dcb0e28a", "csrf"=>"AjvbONdv2UTK41/MWDeSCJ6dAn0hBxXGl9UnwwS7l/w=", "trac
# king"=>{"HTTP_USER_AGENT"=>"da39a3ee5e6b4b0d3255bfef95601890afd80709", "HTTP_ACCEPT_LANGUAGE"=>"da39a3ee5e6b4b0d3255bfef95601890afd80709"}, "user_i
# d"=>1}
# [3] pry(#<ApplicationController>)> params
# => {"username"=>"skittles123", "password"=>"iluvskittles"}
# [1] pry(#<ApplicationController>)> session
# => {"session_id"=>"88a6ca74d4c81e98a2ee0026805f88db647bfeed37d77a69b94b02fbd2980ca6", "csrf"=>"itP7vnUXpihDX8H9mQJRmxczllTBj95HglJr7dGJmnM=", "trac
# king"=>{"HTTP_USER_AGENT"=>"da39a3ee5e6b4b0d3255bfef95601890afd80709", "HTTP_ACCEPT_LANGUAGE"=>"da39a3ee5e6b4b0d3255bfef95601890afd80709"}, "user_i
# d"=>1, "username"=>"skittles123", "password"=>"iluvskittles"}
# binding.pry
      redirect to '/account'
    else
      redirect to '/error'
    end
  end

  get '/error' do
    erb :error
  end

  get '/account' do
    @current_user = User.find_by_id(session[user_id])
    binding.pry # doesn't hit
    if @current_user
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
