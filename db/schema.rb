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

ActiveRecord::Schema.define(:version => 20111019191323) do

  create_table "build_skills", :force => true do |t|
    t.integer   "build_id"
    t.integer   "skill_id"
    t.integer   "rune_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "build_type_associations", :force => true do |t|
    t.integer  "build_id"
    t.integer  "build_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "build_types", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "acronym"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "builds", :force => true do |t|
    t.string    "name"
    t.text      "description"
    t.integer   "min_level"
    t.integer   "recommended_level"
    t.boolean   "private"
    t.integer   "user_id"
    t.integer   "char_class_id"
    t.integer   "forked_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "char_classes", :force => true do |t|
    t.string    "name"
    t.text      "description"
    t.string    "resource"
    t.string    "slug"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.text      "content"
    t.integer   "user_id"
    t.integer   "build_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "likes", :force => true do |t|
    t.integer   "vote"
    t.integer   "user_id"
    t.integer   "build_id"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "rune_effects", :force => true do |t|
    t.string    "name"
    t.text      "description"
    t.integer   "level"
    t.integer   "skill_id"
    t.integer   "rune_id"
    t.string    "slug"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "runes", :force => true do |t|
    t.string    "name"
    t.text      "description"
    t.integer   "level"
    t.string    "img_url"
    t.string    "slug"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "skill_types", :force => true do |t|
    t.string    "name"
    t.integer   "char_class_id"
    t.string    "slug"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "skills", :force => true do |t|
    t.integer   "level"
    t.string    "name"
    t.text      "description"
    t.string    "img_url"
    t.string    "cost"
    t.string    "generate"
    t.string    "cooldown"
    t.integer   "char_class_id"
    t.integer   "skill_type_id"
    t.string    "slug"
    t.timestamp "created_at"
    t.timestamp "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string    "name"
    t.text      "description"
    t.integer   "server_id"
    t.integer   "clan_id"
    t.boolean   "admin"
    t.boolean   "premium"
    t.string    "slug"
    t.timestamp "created_at"
    t.timestamp "updated_at"
    t.string    "email",                                 :default => "",   :null => false
    t.string    "encrypted_password",     :limit => 128, :default => "",   :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",                         :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.boolean   "comment_alert",                         :default => true
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
