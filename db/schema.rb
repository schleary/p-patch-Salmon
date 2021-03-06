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

ActiveRecord::Schema.define(version: 20141211000652) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: true do |t|
    t.time     "start_time"
    t.time     "end_time"
    t.date     "day"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "forecasts", force: true do |t|
    t.float    "temp"
    t.float    "temp_min"
    t.float    "temp_max"
    t.float    "humidity"
    t.string   "current_conditions"
    t.string   "description"
    t.string   "icon"
    t.float    "speed"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "day"
  end

  create_table "posts", force: true do |t|
    t.text     "content"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "img"
    t.string   "author"
  end

  create_table "tools", force: true do |t|
    t.string   "name"
    t.string   "img"
    t.boolean  "availability", default: true
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "uid"
    t.boolean  "admin",      default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "confirmed",  default: false
  end

  create_table "weathers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "temp"
    t.float    "humidity"
    t.string   "current_conditions"
    t.string   "description"
    t.string   "weather_icon"
    t.float    "windspeed"
  end

end
