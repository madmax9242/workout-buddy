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

ActiveRecord::Schema.define(version: 20150628181739) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "back_results", force: :cascade do |t|
    t.integer "seated_row"
    t.integer "lat_pulldown"
    t.integer "renegade_row"
    t.integer "good_mornings"
    t.integer "deadlift"
    t.integer "deltoid_fly"
    t.integer "user_id"
  end

  create_table "chest_results", force: :cascade do |t|
    t.integer "flat_press"
    t.integer "incline_press"
    t.integer "cable_fly"
    t.integer "decline_press"
    t.integer "incline_fly"
    t.integer "stablization_pushup"
    t.integer "user_id"
  end

  create_table "legs_results", force: :cascade do |t|
    t.integer "back_squat"
    t.integer "calf_raises"
    t.integer "leg_press"
    t.integer "leg_curls"
    t.integer "leg_extensions"
    t.integer "lunges"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "back_results", "users"
  add_foreign_key "chest_results", "users"
  add_foreign_key "legs_results", "users"
end
