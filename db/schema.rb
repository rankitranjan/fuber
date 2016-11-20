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

ActiveRecord::Schema.define(version: 20161118074107) do

  create_table "bookings", force: :cascade do |t|
    t.decimal  "picklat",              precision: 15, scale: 10
    t.decimal  "picklng",              precision: 15, scale: 10
    t.integer  "car_id",     limit: 4
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "bookings", ["car_id"], name: "index_bookings_on_car_id", using: :btree

  create_table "cars", force: :cascade do |t|
    t.string   "color",        limit: 255
    t.string   "number",       limit: 255
    t.string   "owner_name",   limit: 255
    t.string   "model",        limit: 255
    t.boolean  "availability"
    t.decimal  "latitude",                 precision: 15, scale: 10
    t.decimal  "longitude",                precision: 15, scale: 10
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
  end

  create_table "rides", force: :cascade do |t|
    t.boolean  "status"
    t.decimal  "droplat",              precision: 15, scale: 10
    t.decimal  "droplng",              precision: 15, scale: 10
    t.datetime "time_taken"
    t.integer  "car_id",     limit: 4
    t.integer  "booking_id", limit: 4
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "rides", ["booking_id"], name: "index_rides_on_booking_id", using: :btree
  add_index "rides", ["car_id"], name: "index_rides_on_car_id", using: :btree

  add_foreign_key "bookings", "cars"
  add_foreign_key "rides", "bookings"
  add_foreign_key "rides", "cars"
end
