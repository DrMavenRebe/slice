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

ActiveRecord::Schema.define(version: 20160819001651) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events_steps", force: :cascade do |t|
    t.integer  "user_id",                            null: false
    t.integer  "daily_steps",        default: 0,     null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "last_event_step_id"
    t.boolean  "day_final",          default: false, null: false
  end

  create_table "identities", force: :cascade do |t|
    t.string   "uid"
    t.string   "provider"
    t.string   "access_token"
    t.string   "refresh_token"
    t.string   "timezone"
    t.integer  "expires_at"
    t.integer  "user_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.string   "user_id"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "podia", force: :cascade do |t|
    t.datetime "end_date_at", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "podium_podium_day_totals", force: :cascade do |t|
    t.integer  "podium_placer_id"
    t.integer  "total"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "podium_podium_placers", force: :cascade do |t|
    t.integer  "place"
    t.integer  "podium_id"
    t.integer  "user_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",      default: "", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",       default: "", null: false
    t.string   "company"
    t.string   "market"
    t.string   "team"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

end
