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

ActiveRecord::Schema.define(version: 20160104141035) do

  create_table "clickzans", force: :cascade do |t|
    t.integer  "userid"
    t.integer  "topicid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "userid"
    t.integer  "dishid"
    t.text     "content"
    t.datetime "createtime"
    t.integer  "score"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dishes", force: :cascade do |t|
    t.string   "dishname"
    t.float    "price"
    t.integer  "dining"
    t.integer  "floor"
    t.string   "tags"
    t.integer  "score"
    t.integer  "count"
    t.datetime "createtime"
    t.string   "picurl"
    t.text     "describtion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "topics", force: :cascade do |t|
    t.integer  "userid"
    t.text     "content"
    t.datetime "createtime"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.boolean  "isadmin"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
