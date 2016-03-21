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
    if @user = find_by_username(params)
      session[:user_id] = @user.id
      redirect to '/account'
    else
      # shows the error page if username and ID do not match available users
      redirect to '/error'
    end
  end

  get '/account' do
    erb :account
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end

  get '/error' do
    erb :error
  end

  private
  def find_by_username(params)
    User.find_by(username: params['username'])
  end
end


#
# def get(path, opts = {}, &block)
# conditions = @conditions.dup
# route('GET', path, opts, &block)
#
# @conditions = conditions
# route('HEAD', path, opts, &block)
# end
#
# def post(path, opts = {}, &bk)
# route('POST', path, opts, &bk)
# end
