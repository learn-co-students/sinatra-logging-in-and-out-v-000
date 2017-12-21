#steps
#start by creating a database for users. In terminal "rake db:create_migration NAME=create_users" This will create a migrate directory in the db directory that will have a file with a timestamp
#setup the creation of the table in your new file, then in terminal run "rake db:migrate"
#in the app/models directory, create a class that inherits from ActiveRecord::Base that also recognizes your database attributes
#for tests to start operating, type into terminal "rake db:migrate SINATRA_ENV=test", i believe this puts into a test environment which our rspec tests (or capybara, im not sure) exist

require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  #sets sessions
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
binding.pry
    erb :index
  end

#is Readable
  post '/login' do
#binding.pry
  @user = User.find_by(username: params["username"], password: params["password"])  #this searchs our database using username, and password which are passed into as arguments from our params has which we got in the form

  session[:id] = @user.id #this adds an id paramter to our current session, and sets it to our user instance variable's id
  erb :index
  end

  get '/account' do

  end

  get '/logout' do

  end


end

# =>    post '/sessions' do
# =>      @user = User.find_by(username: params["username"], password: params["password"])
# =>      session[:id] = @user.id  #when a user is added to the database they are automatically associated with a primary id
# =>      redirect '/users/home'
# =>    end
# =>    @user1 = User.create(:username => "skittles123", :password => "iluvskittles", :balance => 1000)
# =>    @user2 = User.create(:username => "flatiron4lyfe", :password => "Rubie!", :balance => 500)
# =>    @user3 = User.create(:username => "kittens1265", :password => "crazycatlady", :balance => 10000)#
