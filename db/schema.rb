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

ActiveRecord::Schema.define(version: 20151128064250) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "en_name",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "information", force: :cascade do |t|
    t.integer  "partner_id",  limit: 4
    t.string   "address",     limit: 255
    t.string   "en_address",  limit: 255
    t.string   "company",     limit: 255
    t.string   "en_company",  limit: 255
    t.string   "open_day",    limit: 255
    t.string   "en_open_day", limit: 255
    t.string   "open_time",   limit: 255
    t.string   "close_time",  limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "partner_url_ships", force: :cascade do |t|
    t.integer  "partner_id", limit: 4
    t.integer  "url_id",     limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "partners", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "en_name",           limit: 255
    t.string   "company",           limit: 255
    t.string   "en_company",        limit: 255
    t.text     "introduction",      limit: 65535
    t.text     "en_introduction",   limit: 65535
    t.text     "my_chillchill",     limit: 65535
    t.text     "en_my_chillchill",  limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size",    limit: 4
    t.datetime "logo_updated_at"
  end

  create_table "projects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "urls", force: :cascade do |t|
    t.text     "url",         limit: 65535
    t.string   "category",    limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
