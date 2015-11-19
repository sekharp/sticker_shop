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

ActiveRecord::Schema.define(version: 20151119162543) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
  end

  create_table "order_stickers", force: :cascade do |t|
    t.integer  "quantity"
    t.integer  "order_id"
    t.integer  "sticker_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "order_stickers", ["order_id"], name: "index_order_stickers_on_order_id", using: :btree
  add_index "order_stickers", ["sticker_id"], name: "index_order_stickers_on_sticker_id", using: :btree

  create_table "orders", force: :cascade do |t|
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "stickers", force: :cascade do |t|
    t.string   "title"
    t.string   "image_url"
    t.decimal  "price",              precision: 8, scale: 2
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.integer  "category_id"
    t.text     "description"
    t.boolean  "retired",                                    default: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  add_index "stickers", ["category_id"], name: "index_stickers_on_category_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "role",            default: 0
    t.string   "street_address"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
  end

  add_foreign_key "order_stickers", "orders"
  add_foreign_key "order_stickers", "stickers"
  add_foreign_key "orders", "users"
  add_foreign_key "stickers", "categories"
end
