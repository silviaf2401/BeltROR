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

ActiveRecord::Schema.define(version: 20160831004401) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "productboughts", force: true do |t|
    t.string   "name"
    t.float    "price"
    t.integer  "seller_id"
    t.integer  "buyer_id_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "productboughts", ["buyer_id_id"], name: "index_productboughts_on_buyer_id_id", using: :btree

  create_table "productsellings", force: true do |t|
    t.string   "name"
    t.float    "price"
    t.integer  "seller_id_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "productsellings", ["seller_id_id"], name: "index_productsellings_on_seller_id_id", using: :btree

  create_table "productsolds", force: true do |t|
    t.string   "name"
    t.float    "price"
    t.integer  "buyer_id"
    t.integer  "seller_id_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "productsolds", ["seller_id_id"], name: "index_productsolds_on_seller_id_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
