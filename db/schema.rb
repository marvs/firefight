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

ActiveRecord::Schema.define(:version => 20130902161807) do

  create_table "members", :force => true do |t|
    t.string   "name"
    t.boolean  "active",     :default => true
    t.boolean  "elder",      :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "slug"
  end

  add_index "members", ["slug"], :name => "index_members_on_slug", :unique => true

  create_table "stat_groups", :force => true do |t|
    t.integer  "creator_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "stat_period_id"
  end

  create_table "stat_periods", :force => true do |t|
    t.date     "start_date"
    t.date     "end_date"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stats", :force => true do |t|
    t.integer  "level"
    t.integer  "donated"
    t.integer  "received"
    t.integer  "trophies"
    t.integer  "member_id"
    t.integer  "stat_group_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  :default => false
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
