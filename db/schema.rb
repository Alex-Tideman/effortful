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

ActiveRecord::Schema.define(version: 20150923002323) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "efforts", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.string   "location"
    t.string   "start_date"
    t.string   "length"
    t.string   "requested_reward"
    t.integer  "user_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "efforts", ["user_id"], name: "index_efforts_on_user_id", using: :btree

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "gender"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "password_digest"
    t.string   "hobby"
    t.string   "mission"
    t.string   "location"
    t.string   "role",            default: "Member"
  end

  add_foreign_key "efforts", "users"
  add_foreign_key "user_roles", "roles"
  add_foreign_key "user_roles", "users"
end