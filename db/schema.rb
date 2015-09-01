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

ActiveRecord::Schema.define(version: 20150901033229) do

  create_table "customers", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "reward_points_gained"
    t.integer  "reward_points_redeemed"
    t.integer  "reward_points_balance"
    t.integer  "referral_count"
    t.integer  "referral_amount"
    t.integer  "orders_count"
    t.integer  "orders_amount"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "code"
  end

  add_index "customers", ["code"], name: "index_customers_on_code", unique: true

  create_table "discounts", force: :cascade do |t|
    t.string   "code"
    t.float    "value"
    t.date     "ends_at"
    t.date     "starts_at"
    t.string   "status"
    t.float    "minimum_order_amount"
    t.string   "usage_limit"
    t.string   "applies_to_id"
    t.boolean  "applies_once"
    t.string   "discount_type"
    t.string   "applies_to_resource"
    t.integer  "times_used"
    t.date     "creation_date"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "discounts", ["code"], name: "index_discounts_on_code", unique: true

  create_table "registration_settings", force: :cascade do |t|
    t.integer  "Value_of_coupon"
    t.integer  "Validity_of_coupon"
    t.integer  "No_of_Coupons"
    t.integer  "No_of_times_coupon_use"
    t.integer  "price_range_for_coupon_to_valid"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "reward_settings", force: :cascade do |t|
    t.string   "points_for_registration"
    t.string   "min_purchase_amount_earn_points"
    t.string   "points_earn_for_min_amount"
    t.string   "min_points_to_redeem"
    t.string   "amount_for_min_redeem_points"
    t.string   "points_for_referral"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "shopify_accounts", force: :cascade do |t|
    t.string   "shopify_name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "shopify_shops", force: :cascade do |t|
    t.string   "shopify_domain"
    t.string   "shopify_api_key"
    t.string   "shopify_password"
    t.string   "shopify_refresh_token"
    t.string   "shopify_access_token"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "shops", force: :cascade do |t|
    t.string   "shopify_domain", null: false
    t.string   "shopify_token",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "shops", ["shopify_domain"], name: "index_shops_on_shopify_domain", unique: true

  create_table "transactions", force: :cascade do |t|
    t.integer  "customer_id"
    t.string   "transaction_type"
    t.float    "amount"
    t.integer  "coupoun_id"
    t.float    "discount_amount"
    t.integer  "points"
    t.integer  "order_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "details"
  end

end
