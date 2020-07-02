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

ActiveRecord::Schema.define(version: 2020_07_02_125212) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.integer "mod_id", null: false
    t.integer "upvote"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mod_id"], name: "index_comments_on_mod_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mods", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "game_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["game_id"], name: "index_mods_on_game_id"
  end

  create_table "mods_categories", force: :cascade do |t|
    t.integer "mod_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_mods_categories_on_category_id"
    t.index ["mod_id"], name: "index_mods_categories_on_mod_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users_downloads", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "mod_id", null: false
    t.boolean "endorsed"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mod_id"], name: "index_users_downloads_on_mod_id"
    t.index ["user_id"], name: "index_users_downloads_on_user_id"
  end

  add_foreign_key "comments", "mods"
  add_foreign_key "comments", "users"
  add_foreign_key "mods", "games"
  add_foreign_key "mods_categories", "categories"
  add_foreign_key "mods_categories", "mods"
  add_foreign_key "users_downloads", "mods"
  add_foreign_key "users_downloads", "users"
end
