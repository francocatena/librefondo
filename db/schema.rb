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

ActiveRecord::Schema.define(version: 20130227190703) do

  create_table "funders", force: true do |t|
    t.integer  "trust_fund_id"
    t.integer  "fund_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "funds", force: true do |t|
    t.string   "name",                     null: false
    t.integer  "lock_version", default: 0, null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "payments", force: true do |t|
    t.date     "date"
    t.integer  "trust_fund_id"
    t.string   "kind"
    t.integer  "lock_version",                              default: 0, null: false
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.decimal  "amount",           precision: 23, scale: 8
    t.decimal  "estimated_amount", precision: 23, scale: 8
    t.decimal  "amortization",     precision: 23, scale: 8
    t.integer  "pay_day"
    t.decimal  "daily_acrual",     precision: 23, scale: 8
    t.decimal  "residual_value",   precision: 23, scale: 8
    t.decimal  "period_rate",      precision: 23, scale: 8
    t.decimal  "net_value",        precision: 23, scale: 8
  end

  add_index "payments", ["trust_fund_id"], name: "index_payments_on_trust_fund_id"

  create_table "trust_funds", force: true do |t|
    t.string   "name",                                                     null: false
    t.integer  "base"
    t.decimal  "coupon_tv",           precision: 23, scale: 8
    t.decimal  "coupon_tv_cap",       precision: 23, scale: 8
    t.decimal  "coupon_tv_floor",     precision: 23, scale: 8
    t.decimal  "nominal_value",       precision: 23, scale: 8
    t.decimal  "differential_margin", precision: 23, scale: 8
    t.decimal  "broadcast_cost",      precision: 23, scale: 8
    t.decimal  "price",               precision: 23, scale: 8
    t.string   "rating"
    t.date     "buy_date"
    t.date     "settlement_date"
    t.date     "broadcast_date"
    t.date     "expiration_date"
    t.decimal  "tenancy",             precision: 23, scale: 8
    t.decimal  "purchase_price",      precision: 23, scale: 8
    t.decimal  "tcpe",                precision: 23, scale: 8
    t.decimal  "minimal_cost",        precision: 23, scale: 8
    t.decimal  "maximal_cost",        precision: 23, scale: 8
    t.date     "cut_date"
    t.integer  "lock_version",                                 default: 0, null: false
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.integer  "number_of_payments"
    t.string   "identifier"
  end

  add_index "trust_funds", ["name"], name: "index_trust_funds_on_name"

  create_table "users", force: true do |t|
    t.string   "name",                                null: false
    t.string   "lastname"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "roles_mask",             default: 0,  null: false
    t.integer  "lock_version",           default: 0,  null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["lastname"], name: "index_users_on_lastname"
  add_index "users", ["name"], name: "index_users_on_name"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.integer  "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  add_index "versions", ["whodunnit"], name: "index_versions_on_whodunnit"

end
