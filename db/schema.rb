# encoding: UTF-8
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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120624081810) do

  create_table "comments", :force => true do |t|
    t.integer  "post_id"
    t.string   "author"
    t.string   "author_email"
    t.string   "author_url"
    t.datetime "date"
    t.text     "content"
    t.boolean  "approved"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.datetime "date"
    t.text     "content"
    t.string   "title"
    t.string   "status"
    t.string   "excerpt"
    t.string   "comment_status"
    t.string   "ping_status"
    t.string   "post_password"
    t.string   "permalink"
    t.string   "post_type"
    t.integer  "comment_count"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.date     "dob"
    t.string   "gender"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
