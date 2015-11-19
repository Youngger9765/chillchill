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

ActiveRecord::Schema.define(version: 20151119053129) do

  create_table "information", force: :cascade do |t|
    t.string   "address"
    t.string   "en_address"
    t.string   "company"
    t.string   "en_company"
    t.string   "open_day"
    t.string   "en_open_day"
    t.time     "open_time"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "partner_information_ships", force: :cascade do |t|
    t.integer  "partner_id"
    t.integer  "information_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "partners", force: :cascade do |t|
    t.string   "name"
    t.string   "en_name"
    t.string   "company"
    t.string   "en_company"
    t.text     "introduction"
    t.text     "en_introduction"
    t.text     "my_chillchill"
    t.text     "en_my_chillchill"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "projects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
