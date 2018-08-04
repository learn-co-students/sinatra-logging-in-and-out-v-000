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
    if @user
      session[:user_id] = @user.id
#       binding.pry
#       [1] pry(#<ApplicationController>)> params
# => {"username"=>"skittles123", "password"=>"iluvskittles"}
# [2] pry(#<ApplicationController>)> @user
# => #<User:0x007f9a67351a70 id: 1, username: "skittles123", password: "iluvskittles", balance: #<BigDecimal:7f9a66caca08,'0.1E4',9(27)>>
# [3] pry(#<ApplicationController>)> @user.id
# => 1
# [4] pry(#<ApplicationController>)> session
# => {"session_id"=>"03d6ffd62c1118456071fe5d2ea2e43229787175f4762c75bae42c3e241506bc", "csrf"=>"PKE+bfaaIniS409TdLPWdagNNeiq67H7nfLbjcSHTEA=", "tracking"=>{"HTTP_USER_AGENT"=>"da39a3ee5e6b4b0d3255bfef95601890afd80709", "HTTP_ACCEPT_LANGUAGE"=>"da39a3ee5e6b4b0d3255bfef95601890afd80709"}, "user_id"=>1}
      redirect to '/account'
    end
    redirect to '/error'
  end

  get '/error' do
    erb :error
  end

  get '/account' do
    erb :account
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end
