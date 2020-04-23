class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t| #from dog example in activerecord setup in sinatra
      t.string :username #had to change this like 10 times, in the future look in seeds
      t.string :password
      t.decimal :balance #http://edgeguides.rubyonrails.org/active_record_migrations.html for this
    end
  end
end

#first, bundle exec rake db:create_migration NAME=create_post
#had to use bundle exec rake db:migrate SINATRA_ENV=test
