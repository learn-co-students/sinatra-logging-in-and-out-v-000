class User < ActiveRecord::Base
  # Nothing goes here because we need to go to bash & type:
  # 1.) rake db:create_migration NAME=create_users
  # 2.) go to the directory that will be created:
  #     db/migrate/201711xxXXxxXX_create_users.rb

  # 3.) delete the contents of the "class CreateUsers" and put this:
  #  class CreateUsers < ActiveRecord::Migration
  #     def change
  #       create_table :users do |table|
  #         table.string :username
  #         table.string :password
  #         table.integer :balance        #=> This may be a string or integer, I dunno yet.
  #       end
  #     end
  #   end
end


# CUSTOM NOTES ON THIS PROJECT: Here are some important commands:
# 1.) rake db:create_migration NAME=create_posts
# 2.) rake db:migrate ...The default lab doesn't have the model "post"
#     ...really doing anything because it is only doing stuff in active Record;
#     ...it doesn't perform it's own functions like models in previous labs.
