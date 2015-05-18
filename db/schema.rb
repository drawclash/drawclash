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

ActiveRecord::Schema.define(version: 20150518155357) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "battles", force: :cascade do |t|
    t.string   "name",                      null: false
    t.integer  "corner_id"
    t.integer  "entries_count", default: 0
    t.datetime "open_until"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "battles", ["corner_id"], name: "index_battles_on_corner_id", using: :btree

  create_table "corners", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "logo_uid"
    t.string   "slug",                      null: false
    t.text     "description"
    t.datetime "created_at",                null: false
    t.integer  "battles_count", default: 0
  end

  add_index "corners", ["slug"], name: "index_corners_on_slug", unique: true, using: :btree

  create_table "corners_users", id: false, force: :cascade do |t|
    t.integer "corner_id"
    t.integer "user_id"
  end

  create_table "entries", force: :cascade do |t|
    t.integer  "battle_id"
    t.integer  "user_id"
    t.string   "image_uid",               null: false
    t.string   "likes",      default: [],              array: true
    t.datetime "created_at",              null: false
  end

  add_index "entries", ["battle_id"], name: "index_entries_on_battle_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",         null: false
    t.string   "email"
    t.string   "crypted_password", null: false
    t.string   "salt",             null: false
    t.datetime "created_at",       null: false
  end

  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
