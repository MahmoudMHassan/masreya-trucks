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

ActiveRecord::Schema.define(version: 20150408003426) do

  create_table "ads", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.text     "description", limit: 65535
    t.boolean  "validated",   limit: 1
    t.string   "phone",       limit: 255
    t.string   "email",       limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "image1",      limit: 255
    t.string   "image2",      limit: 255
    t.string   "image3",      limit: 255
    t.string   "image4",      limit: 255
    t.string   "image",       limit: 255
  end

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "provider",   limit: 255
    t.string   "uid",        limit: 255
    t.string   "token",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "bookmarks", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "ad_id",      limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "bookmarks", ["ad_id"], name: "index_bookmarks_on_ad_id", using: :btree
  add_index "bookmarks", ["user_id"], name: "index_bookmarks_on_user_id", using: :btree

  create_table "buyers", primary_key: "user_id", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "buyers", ["user_id"], name: "index_buyers_on_user_id", using: :btree

  create_table "company_sellers", primary_key: "user_id", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "company_sellers", ["user_id"], name: "index_company_sellers_on_user_id", using: :btree

  create_table "heavytrucks", primary_key: "vehicle_id", force: :cascade do |t|
    t.boolean  "capacity",   limit: 1
    t.integer  "mileage",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "heavytrucks", ["vehicle_id"], name: "index_heavytrucks_on_vehicle_id", using: :btree

  create_table "makes", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "vehicle_id", limit: 4
    t.integer  "ad_id",      limit: 4
    t.boolean  "new",        limit: 1
    t.boolean  "purchase",   limit: 1
    t.boolean  "imported",   limit: 1
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "makes", ["ad_id"], name: "fk_rails_a83ffb1611", using: :btree
  add_index "makes", ["user_id"], name: "user_id", using: :btree
  add_index "makes", ["vehicle_id"], name: "fk_rails_dd568d2954", using: :btree

  create_table "sellers", primary_key: "user_id", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sellers", ["user_id"], name: "index_sellers_on_user_id", using: :btree

  create_table "semitrailers", primary_key: "vehicle_id", force: :cascade do |t|
    t.boolean  "capacity",   limit: 1
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "semitrailers", ["vehicle_id"], name: "index_semitrailers_on_vehicle_id", using: :btree

  create_table "semitrailertrucks", primary_key: "vehicle_id", force: :cascade do |t|
    t.integer  "mileage",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "semitrailertrucks", ["vehicle_id"], name: "index_semitrailertrucks_on_vehicle_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "provider",         limit: 255
    t.string   "uid",              limit: 255
    t.string   "name",             limit: 255
    t.string   "oauth_token",      limit: 255
    t.datetime "oauth_expires_at"
    t.string   "email",            limit: 255
    t.string   "password",         limit: 255
    t.string   "fname",            limit: 255
    t.string   "lname",            limit: 255
    t.string   "country",          limit: 255
    t.string   "phone",            limit: 255
    t.boolean  "validated",        limit: 1
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "avatar",           limit: 255
  end

  create_table "vans", primary_key: "vehicle_id", force: :cascade do |t|
    t.boolean  "capacity",   limit: 1
    t.integer  "mileage",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "vans", ["vehicle_id"], name: "index_vans_on_vehicle_id", using: :btree

  create_table "vehicles", force: :cascade do |t|
    t.string   "make",       limit: 255
    t.string   "model",      limit: 255
    t.integer  "manyear",    limit: 4
    t.string   "country",    limit: 255
    t.integer  "axles",      limit: 4
    t.boolean  "gearbox",    limit: 1
    t.string   "colour",     limit: 255
    t.integer  "price",      limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_foreign_key "bookmarks", "ads"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "buyers", "users"
  add_foreign_key "company_sellers", "users"
  add_foreign_key "heavytrucks", "vehicles"
  add_foreign_key "makes", "ads"
  add_foreign_key "makes", "sellers", column: "user_id", primary_key: "user_id", name: "makes_ibfk_1"
  add_foreign_key "makes", "vehicles"
  add_foreign_key "sellers", "users"
  add_foreign_key "semitrailers", "vehicles"
  add_foreign_key "semitrailertrucks", "vehicles"
  add_foreign_key "vans", "vehicles"
end
