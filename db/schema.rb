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

ActiveRecord::Schema.define(version: 20150916041610) do

  create_table "codes", force: :cascade do |t|
    t.integer  "discount_generator_id"
    t.string   "coupon_code"
    t.string   "status"
    t.integer  "times_used"
    t.integer  "customer_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "coupon_type"
    t.date     "starts_at"
    t.date     "end_date"
    t.integer  "coupon_value"
    t.integer  "coupon_validity"
    t.integer  "minimum_purchase_amount"
  end

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
    t.string   "refer_code"
    t.string   "referrer"
    t.string   "email"
    t.string   "account_type"
    t.boolean  "account_authorised"
    t.date     "validity_date"
    t.integer  "reward_points_encashed"
  end

  create_table "discount_generators", force: :cascade do |t|
    t.string   "name_of_discount_campaign"
    t.string   "coupon_prefix"
    t.string   "discount_type"
    t.integer  "no_of_coupons"
    t.date     "starts_at"
    t.date     "end_date"
    t.string   "coupon_for"
    t.integer  "value"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "coupon_code"
    t.string   "status"
    t.float    "minimum_order_amount"
    t.integer  "usage_limit"
    t.integer  "minimum_purchase_amount"
  end

  add_index "discount_generators", ["name_of_discount_campaign"], name: "index_discount_generators_on_name_of_discount_campaign", unique: true

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

  create_table "encash_settings", force: :cascade do |t|
    t.boolean  "is_applicable_to_standard"
    t.boolean  "is_applicable_to_premium"
    t.boolean  "is_applicable_to_affiliate"
    t.integer  "standard_account_percentage"
    t.integer  "premium_account_percentage"
    t.integer  "affiliate_account_percentage"
    t.integer  "minimum_points_to_encash"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "order_id"
    t.string   "email"
    t.integer  "total_line_items_price"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "registration_coupons", force: :cascade do |t|
    t.integer  "coupon_value"
    t.integer  "price_range"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "registration_setting_id"
  end

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
    t.integer  "points_for_registration"
    t.integer  "min_purchase_amount_earn_points"
    t.integer  "points_earn_for_min_amount"
    t.integer  "min_points_to_redeem"
    t.integer  "amount_for_min_redeem_points"
    t.integer  "points_for_referral"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "coupon_validity"
    t.integer  "minimum_purchase_amount"
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

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "login"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
