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

ActiveRecord::Schema.define(version: 20170706143402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tickers", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_tickers_on_code"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "ticker_id"
    t.date "transaction_date"
    t.decimal "open_price"
    t.decimal "high_price"
    t.decimal "low_price"
    t.decimal "close_price"
    t.bigint "volume"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["close_price"], name: "index_transactions_on_close_price"
    t.index ["high_price"], name: "index_transactions_on_high_price"
    t.index ["low_price"], name: "index_transactions_on_low_price"
    t.index ["open_price"], name: "index_transactions_on_open_price"
    t.index ["transaction_date"], name: "index_transactions_on_transaction_date"
    t.index ["volume"], name: "index_transactions_on_volume"
  end

end
