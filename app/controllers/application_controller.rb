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
    user = User.find_by(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect to '/account'
    end
    erb :error
  end

  get '/account' do
    # Here's the code that works:
    if Helpers.is_logged_in?(session)
      @user = Helpers.current_user(session)
      erb :account
    else
      erb :error
    end
    
    # The code below, along with some of the commented code in the account.erb file, works.
    # However, for reasons mentioned in account.erb, I don't need to put the session hash into an instance variable. 
    # Also, it's better to put as much logic as possible into Controllers and helpers; only #Helpers.current_user needs to be called in account.erb . 
    
      # if Helpers.is_logged_in?(session)
      # #binding.pry
      #   @session = session
      #   erb :account
      # else
      #   erb :error
      # end

    #-----------Experimental code--------------------
    
    # These two sets of code work EXACTLY the same way:
    
    # if Helpers.is_logged_in?(session)
    #   redirect '/user-logged-in'
    # else
    #   redirect '/user-not-logged-in'
    # end
    
    # if Helpers.is_logged_in?(session)
    #   redirect '/user-logged-in'
    # end
    # redirect '/user-not-logged-in'
    
    # THESE two sets of code do NOT work the same way, however, with OR without the call to #return :
    
    # if Helpers.is_logged_in?(session)
    #   @user = Helpers.current_user(session)
    #   erb :account
    #   return
    # end
    # erb :error
    
    # if Helpers.is_logged_in?(session)
    #   @user = Helpers.current_user(session)
    #   erb :account
    #   return
    # else
    #   erb :error
    # end
    # erb :error
    
    # I got #erb mixed up with #redirect, in terms of which one exits a route and which one goes back to the rest of the route. See my NOTES.md file for more. 
    # I don't need to put the #redirect call inside of an "else" statement, but I DO need to put the #erb call inside of #else.
    
    # Also, although #return exits out of the route (I think) and doesn't execute "erb :error", it stays on the account.erb page without rendering anything. Without the #return, the route goes onto the next line of code after the "if" statement: "erb :error".
    
    #-------------Previous code that doesn't completely work----------
    
    #if Helpers.is_logged_in?(session)
      #binding.pry
      #@user = Helpers.current_user(session)
      #binding.pry
      #erb :account
      #binding.pry
      #return
    #else
      #erb :error
    #end
    #binding.pry
    #erb :error
    
    # Note that here ^^^, if the user is logged in, ALL of those binding.pry statements (as well as those inside of the account.erb file) get called.
    
    #if Helpers.is_logged_in?(session)
    #binding.pry
      #@session = session
      #erb :account
    #else
     # erb :error
    #end
    #erb :error
  end

  get '/logout' do
    session.clear
    redirect "/"
  end
  
  # get '/user-logged-in' do
  #   "The user is logged in!"
  # end
  # 
  # get '/user-not-logged-in' do
  #   "The user is NOT logged in."
  # end

end
