# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_11_30_185424) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accounts", force: :cascade do |t|
    t.bigint "customer_id", null: false
    t.bigint "plan_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "acc_id"
    t.index ["customer_id"], name: "index_accounts_on_customer_id"
    t.index ["plan_id"], name: "index_accounts_on_plan_id"
  end

  create_table "connections", force: :cascade do |t|
    t.bigint "server_id", null: false
    t.string "ip"
    t.string "serial_number"
    t.bigint "account_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_connections_on_account_id"
    t.index ["server_id"], name: "index_connections_on_server_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "region"
    t.string "code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "email"
    t.string "phone"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "plans", force: :cascade do |t|
    t.string "name"
    t.integer "interval"
    t.decimal "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "servers", force: :cascade do |t|
    t.bigint "country_id", null: false
    t.string "ip"
    t.string "username"
    t.string "password"
    t.boolean "premium", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "ping", default: 0
    t.index ["country_id"], name: "index_servers_on_country_id"
  end

  add_foreign_key "accounts", "customers"
  add_foreign_key "accounts", "plans"
  add_foreign_key "connections", "accounts"
  add_foreign_key "connections", "servers"
  add_foreign_key "servers", "countries"
end
