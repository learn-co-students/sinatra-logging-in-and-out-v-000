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
    end
    
    erb :error
    


  end

  get '/sessions/logout' do 
    
    session.clear

    redirect '/'
  end

  get '/error' do 

    erb :error

  end


  get '/account' do
    

    
    #if !session[:user_id]      
      
     # puts "no session"
      #{}"You Must <a href="/">Log In</a> to View Your Balance"
    #end


      @user = Helpers.current_user(session) 

      if @user
        erb :account
      else
        erb :error
      end


      #puts "Your Balance: #{'%.1f' % user.balance}"
      
#      if Helpers.is_logged_in(session) 
 #       puts "#{user.username}"
  #      puts "#{user.balance}"
   #     binding.pry
    #  else 
     #   puts "blah"
      #  binding.pry
      #end 

      

    

  end

  get '/logout' do
    session.clear

    redirect '/'

  end


end

