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

ActiveRecord::Schema.define(version: 20171122152334) do

  create_table "genres", force: :cascade do |t|
    t.string "name", null: false
    t.integer "parent_id"
    t.integer "itunes_genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
    t.index ["parent_id"], name: "index_genres_on_parent_id"
  end

  create_table "media", force: :cascade do |t|
    t.string "name", null: false
    t.string "category", null: false
    t.integer "price_amount", null: false
    t.string "price_currency", null: false
    t.text "summary"
    t.string "copyrights"
    t.string "artist"
    t.string "image_url"
    t.integer "itunes_medium_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "media_rankings", force: :cascade do |t|
    t.integer "medium_id"
    t.integer "genre_id"
    t.integer "rank", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_media_rankings_on_genre_id"
    t.index ["medium_id"], name: "index_media_rankings_on_medium_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
