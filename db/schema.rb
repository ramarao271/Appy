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

ActiveRecord::Schema.define(version: 20150819025544) do

  create_table "reward_settings", force: :cascade do |t|
    t.string   "points_for_registration"
    t.string   "minium_purchase_amount_earn_points"
    t.string   "points_earn_for_minimum_amount"
    t.string   "minimum_points_to_redeem"
    t.string   "amount_for_minimum_redeem_points"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
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

end
