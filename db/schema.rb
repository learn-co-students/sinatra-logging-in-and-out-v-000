# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20180422163509) do

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.integer "balance"
=======
ActiveRecord::Schema.define(version: 20180422201047) do

  create_table "User", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.decimal "balance"
>>>>>>> 9e36ad970499b1105e20adc25276212f4bcf48c8
  end

end
