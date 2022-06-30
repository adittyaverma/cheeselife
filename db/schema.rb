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

ActiveRecord::Schema.define(version: 2022_06_30_172647) do

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "desc"
    t.decimal "price", precision: 10, scale: 2
    t.integer "aval_quantity"
    t.string "food_type"
    t.string "cuisine"
    t.integer "menu_id"
    t.boolean "status", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "menus", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "summary"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "status", default: true
  end

  create_table "order_items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "order_id"
    t.integer "item_id"
    t.integer "quantity"
    t.decimal "base_price", precision: 10, scale: 2, default: "0.0"
    t.decimal "vat", precision: 10, scale: 2, default: "0.0"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "status"
    t.integer "user_id"
    t.integer "rest_id"
    t.decimal "base_price", precision: 10, scale: 2, default: "0.0"
    t.decimal "vat", precision: 10, scale: 2, default: "0.0"
    t.decimal "discount", precision: 10, scale: 2, default: "0.0"
    t.decimal "cashback", precision: 10, scale: 2, default: "0.0"
    t.decimal "delivery_fee", precision: 10, scale: 2, default: "0.0"
    t.decimal "grand_total", precision: 10, scale: 2, default: "0.0"
    t.integer "driver_id"
    t.integer "payment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal "eta", precision: 10
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.decimal "lat", precision: 8, scale: 6
    t.decimal "long", precision: 9, scale: 6
  end

end
