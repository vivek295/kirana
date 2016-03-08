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

ActiveRecord::Schema.define(version: 20160308121721) do

  create_table "addresses", force: :cascade do |t|
    t.string   "type",       limit: 255
    t.string   "name",       limit: 255
    t.string   "address_1",  limit: 255
    t.string   "address_2",  limit: 255
    t.string   "city",       limit: 255
    t.string   "state",      limit: 255
    t.integer  "pincode",    limit: 4
    t.string   "landmark",   limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "addresses", ["user_id"], name: "index_addresses_on_user_id", using: :btree

  create_table "brands", force: :cascade do |t|
    t.string   "brand_name",  limit: 255
    t.boolean  "is_approved"
    t.boolean  "is_active"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "category_name", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "order_lines", force: :cascade do |t|
    t.string   "shop_product_name",  limit: 255
    t.string   "shop_product_price", limit: 255
    t.float    "quantity",           limit: 24
    t.float    "line_value",         limit: 24
    t.boolean  "is_fulfilled"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "orders", force: :cascade do |t|
    t.date     "order_date"
    t.float    "shipping_charge", limit: 24
    t.float    "order_value",     limit: 24
    t.string   "order_state",     limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "product_name",        limit: 255
    t.boolean  "is_active"
    t.boolean  "is_approved"
    t.string   "unit_type",           limit: 255
    t.string   "product_description", limit: 255
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "shop_inventory_details", force: :cascade do |t|
    t.string   "inventory_type", limit: 255
    t.string   "notes",          limit: 255
    t.float    "quantity",       limit: 24
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "shop_products", force: :cascade do |t|
    t.string   "product_name",        limit: 255
    t.string   "brand_name",          limit: 255
    t.string   "unit_type",           limit: 255
    t.string   "product_description", limit: 255
    t.float    "selling_price",       limit: 24
    t.float    "mrp",                 limit: 24
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "shop_profiles", force: :cascade do |t|
    t.string   "shop_name",    limit: 255
    t.string   "phone_number", limit: 255
    t.string   "email",        limit: 255
    t.integer  "address_id",   limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "shop_profiles", ["address_id"], name: "index_shop_profiles_on_address_id", using: :btree

  create_table "shop_profiles_users", force: :cascade do |t|
    t.integer "user_id",         limit: 4
    t.integer "shop_profile_id", limit: 4
  end

  add_index "shop_profiles_users", ["shop_profile_id"], name: "index_shop_profiles_users_on_shop_profile_id", using: :btree
  add_index "shop_profiles_users", ["user_id"], name: "index_shop_profiles_users_on_user_id", using: :btree

  create_table "user_baskets", force: :cascade do |t|
    t.float    "quantity",   limit: 24
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "user_logs", force: :cascade do |t|
    t.date     "log"
    t.string   "details",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string   "first_name",   limit: 255
    t.string   "last_name",    limit: 255
    t.string   "phone_number", limit: 255
    t.string   "email",        limit: 255
    t.integer  "user_id",      limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "user_profiles", ["user_id"], name: "index_user_profiles_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "role",                   limit: 4
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "addresses", "users"
  add_foreign_key "shop_profiles", "addresses"
  add_foreign_key "user_profiles", "users"
end
