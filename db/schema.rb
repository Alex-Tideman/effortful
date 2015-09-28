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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150928225358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "efforts", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "start_date"
    t.string   "length"
    t.string   "requested_reward"
    t.integer  "member_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "volunteer_id"
    t.float    "ne_lat"
    t.float    "ne_lng"
    t.float    "sw_lat"
    t.float    "sw_lng"
  end

  add_index "efforts", ["member_id"], name: "index_efforts_on_member_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_efforts", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "effort_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_efforts", ["effort_id"], name: "index_user_efforts_on_effort_id", using: :btree
  add_index "user_efforts", ["user_id"], name: "index_user_efforts_on_user_id", using: :btree

  create_table "user_roles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "user_roles", ["role_id"], name: "index_user_roles_on_role_id", using: :btree
  add_index "user_roles", ["user_id"], name: "index_user_roles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "image"
    t.string   "uid"
    t.string   "provider"
    t.string   "token"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "hobby"
    t.string   "mission"
    t.string   "location",   default: "sound.misty.loads"
    t.string   "role",       default: "Member"
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "yes",        default: 0
    t.integer  "no",         default: 0
    t.integer  "user_id"
    t.integer  "effort_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "votes", ["effort_id"], name: "index_votes_on_effort_id", using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

  add_foreign_key "efforts", "users", column: "member_id"
  add_foreign_key "user_efforts", "efforts"
  add_foreign_key "user_efforts", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
  add_foreign_key "votes", "efforts"
  add_foreign_key "votes", "users"
end
