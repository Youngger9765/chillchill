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

ActiveRecord::Schema.define(version: 20151220023337) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "en_name",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "category_project_ships", force: :cascade do |t|
    t.integer  "category_id", limit: 4
    t.integer  "project_id",  limit: 4
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "category_project_ships", ["category_id"], name: "index_category_project_ships_on_category_id", using: :btree
  add_index "category_project_ships", ["project_id"], name: "index_category_project_ships_on_project_id", using: :btree

  create_table "customer_answers", force: :cascade do |t|
    t.integer  "registration_form_id", limit: 4
    t.integer  "question_id",          limit: 4
    t.text     "content",              limit: 65535
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "customer_answers", ["question_id"], name: "index_customer_answers_on_question_id", using: :btree
  add_index "customer_answers", ["registration_form_id"], name: "index_customer_answers_on_registration_form_id", using: :btree

  create_table "event_reservation_day_ships", force: :cascade do |t|
    t.integer  "reservation_day_id", limit: 4
    t.integer  "event_id",           limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer  "project_id",        limit: 4
    t.string   "name",              limit: 255
    t.string   "en_name",           limit: 255
    t.text     "introduction",      limit: 65535
    t.text     "en_introduction",   limit: 65535
    t.text     "content",           limit: 65535
    t.text     "en_content",        limit: 65535
    t.text     "date",              limit: 65535
    t.text     "time",              limit: 65535
    t.text     "place",             limit: 65535
    t.text     "address",           limit: 65535
    t.text     "cost",              limit: 65535
    t.text     "discount",          limit: 65535
    t.text     "notice",            limit: 65535
    t.text     "tips",              limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size",    limit: 4
    t.datetime "logo_updated_at"
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

  create_table "pre_answers", force: :cascade do |t|
    t.string   "a_content",  limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "username",   limit: 255
    t.string   "first_name", limit: 255
    t.string   "last_name",  limit: 255
    t.string   "birthday",   limit: 255
    t.string   "location",   limit: 255
    t.string   "locale",     limit: 255
    t.string   "gender",     limit: 255
    t.text     "education",  limit: 65535
    t.string   "status",     limit: 255
    t.string   "fb_image",   limit: 255
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "profiles", ["location"], name: "index_profiles_on_location", using: :btree
  add_index "profiles", ["status"], name: "index_profiles_on_status", using: :btree
  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "en_name",           limit: 255
    t.string   "title",             limit: 255
    t.string   "en_title",          limit: 255
    t.text     "description",       limit: 65535
    t.text     "en_description",    limit: 65535
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "logo_file_name",    limit: 255
    t.string   "logo_content_type", limit: 255
    t.integer  "logo_file_size",    limit: 4
    t.datetime "logo_updated_at"
  end

  create_table "question_pre_answer_ships", force: :cascade do |t|
    t.integer  "question_id",   limit: 4
    t.integer  "pre_answer_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "questions", force: :cascade do |t|
    t.integer  "event_id",    limit: 4
    t.string   "answer_type", limit: 255
    t.string   "q_category",  limit: 255
    t.text     "content",     limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "questions", ["answer_type"], name: "index_questions_on_answer_type", using: :btree
  add_index "questions", ["event_id"], name: "index_questions_on_event_id", using: :btree
  add_index "questions", ["q_category"], name: "index_questions_on_q_category", using: :btree

  create_table "registration_forms", force: :cascade do |t|
    t.integer  "event_id",       limit: 4
    t.integer  "user_id",        limit: 4
    t.string   "first_name",     limit: 255
    t.string   "last_name",      limit: 255
    t.integer  "phone_number",   limit: 4
    t.string   "email",          limit: 255
    t.integer  "people",         limit: 4
    t.integer  "kids",           limit: 4
    t.string   "registed_day",   limit: 255
    t.string   "payment",        limit: 255
    t.string   "payment_status", limit: 255
    t.text     "notice",         limit: 65535
    t.text     "opinion",        limit: 65535
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "reservation_days", force: :cascade do |t|
    t.string   "day_info",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "urls", force: :cascade do |t|
    t.text     "url",         limit: 65535
    t.string   "category",    limit: 255
    t.text     "description", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "", null: false
    t.string   "encrypted_password",     limit: 255,   default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.string   "role",                   limit: 255
    t.text     "fb_raw_data",            limit: 65535
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "fb_uid",                 limit: 255
    t.string   "fb_token",               limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["fb_uid"], name: "index_users_on_fb_uid", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["role"], name: "index_users_on_role", using: :btree

end
