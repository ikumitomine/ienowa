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

ActiveRecord::Schema.define(version: 2020_10_21_091541) do

  create_table "attribute_banks", force: :cascade do |t|
    t.integer "attribute_post_id", null: false
    t.integer "bank_post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "attribute_posts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "age", null: false
    t.integer "sex", default: 0, null: false
    t.integer "family_form", default: 0, null: false
    t.integer "employment_status", default: 0, null: false
    t.integer "length_job", default: 0, null: false
    t.integer "listed", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "income"
  end

  create_table "bank_posts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "borrowing_year", null: false
    t.integer "borrowing_month", null: false
    t.string "name", null: false
    t.float "rate", null: false
    t.integer "borrowing_length", null: false
    t.integer "payment", null: false
    t.integer "rate_type", default: 0, null: false
    t.integer "borrowing_form", default: 0, null: false
    t.integer "bought_place", default: 0, null: false
    t.text "reason", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "coupons", force: :cascade do |t|
    t.integer "user_id"
    t.boolean "is_valid", default: true
    t.integer "limit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "bank_post_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
