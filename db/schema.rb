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

ActiveRecord::Schema.define(version: 20161018020111) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accomplishments", force: :cascade do |t|
    t.integer "owner_id"
    t.string  "owner_type"
    t.text    "description"
    t.integer "display_order"
  end

  create_table "degrees", force: :cascade do |t|
    t.string   "university"
    t.string   "degree"
    t.datetime "date_start"
    t.datetime "date_end"
  end

  create_table "degrees_resumes", id: false, force: :cascade do |t|
    t.integer "resume_id", null: false
    t.integer "degree_id", null: false
  end

  add_index "degrees_resumes", ["degree_id"], name: "index_degrees_resumes_on_degree_id", using: :btree
  add_index "degrees_resumes", ["resume_id"], name: "index_degrees_resumes_on_resume_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.string   "key",               null: false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "periods", force: :cascade do |t|
    t.datetime "date_start"
    t.datetime "date_end"
    t.integer  "owner_id"
    t.string   "owner_type"
  end

  create_table "positions", force: :cascade do |t|
    t.string   "company"
    t.string   "title"
    t.datetime "date_start"
    t.datetime "date_end"
  end

  create_table "positions_resumes", id: false, force: :cascade do |t|
    t.integer "resume_id",   null: false
    t.integer "position_id", null: false
  end

  add_index "positions_resumes", ["position_id"], name: "index_positions_resumes_on_position_id", using: :btree
  add_index "positions_resumes", ["resume_id"], name: "index_positions_resumes_on_resume_id", using: :btree

  create_table "resumes", force: :cascade do |t|
    t.string   "name"
    t.string   "key",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "resumes", ["key"], name: "index_resumes_on_key", unique: true, using: :btree

  create_table "skills", force: :cascade do |t|
    t.integer  "resume_id"
    t.string   "name"
    t.integer  "level",      default: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string "username",        null: false
    t.string "password_digest"
    t.string "email"
    t.string "phone"
    t.string "github"
    t.string "name"
  end

end
