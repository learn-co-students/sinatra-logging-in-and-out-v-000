class CreateTableUsers<ActiveRecord::Migration[4.2]
  #use  bundle exec rake db: "method" for every time you run a rake command
 # forces the  version in our app to run instead of the lastest version on the web
  def change
    create_table :users do |t|
       t.string  :username
       t.string :password
       t.float :balance
    end
  end
end
