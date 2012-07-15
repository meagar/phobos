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

ActiveRecord::Schema.define(:version => 20120715184331) do

  create_table "contact_requests", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.string   "title"
    t.string   "phone_home"
    t.string   "phone_mobile"
    t.string   "email"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "forum_posts", :force => true do |t|
    t.integer  "created_by_id"
    t.integer  "thread_id"
    t.integer  "parent_id"
    t.string   "created_by"
    t.string   "topic"
    t.string   "body"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "forum_posts", ["created_by_id"], :name => "index_forum_posts_on_created_by_id"
  add_index "forum_posts", ["parent_id"], :name => "index_forum_posts_on_parent_id"
  add_index "forum_posts", ["thread_id"], :name => "index_forum_posts_on_thread_id"

  create_table "forums", :force => true do |t|
    t.integer  "created_by_id"
    t.string   "name"
    t.string   "description"
    t.integer  "position"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "forums", ["created_by_id"], :name => "index_forums_on_created_by_id"

  create_table "news_posts", :force => true do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "front_page_column"
    t.integer  "created_by_id"
    t.string   "blurb_subject"
    t.text     "blurb"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "news_posts", ["created_by_id"], :name => "index_news_posts_on_created_by_id"

  create_table "photo_sets", :force => true do |t|
    t.integer  "created_by_id"
    t.string   "title"
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "sub_title"
  end

  add_index "photo_sets", ["created_by_id"], :name => "index_photo_sets_on_created_by_id"
  add_index "photo_sets", ["position"], :name => "index_photo_sets_on_position"

  create_table "photos", :force => true do |t|
    t.integer  "photo_set_id"
    t.integer  "created_by_id"
    t.string   "image",         :null => false
    t.string   "title"
    t.boolean  "is_thumbnail",  :null => false
    t.text     "description"
    t.integer  "position"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "photos", ["created_by_id"], :name => "index_photos_on_created_by_id"
  add_index "photos", ["photo_set_id"], :name => "index_photos_on_photo_set_id"
  add_index "photos", ["position"], :name => "index_photos_on_position"

  create_table "role_assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "role_assignments", ["role_id"], :name => "index_role_assignments_on_role_id"
  add_index "role_assignments", ["user_id"], :name => "index_role_assignments_on_user_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "display_name"
    t.boolean  "newsletter"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
