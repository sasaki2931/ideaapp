

ActiveRecord::Schema.define(version: 2023_02_15_082755) do

 
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "theme_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["theme_id"], name: "index_favorites_on_theme_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "ideas", force: :cascade do |t|
    t.bigint "theme_id", null: false
    t.bigint "user_id", null: false
    t.string "title", null: false
    t.text "content", null: false
    t.string "img"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["theme_id"], name: "index_ideas_on_theme_id"
    t.index ["user_id"], name: "index_ideas_on_user_id"
  end

  create_table "labellings", force: :cascade do |t|
    t.bigint "theme_id", null: false
    t.bigint "label_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["label_id"], name: "index_labellings_on_label_id"
    t.index ["theme_id"], name: "index_labellings_on_theme_id"
  end

  create_table "labels", force: :cascade do |t|
    t.string "name", default: "デフォルト", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "themes", force: :cascade do |t|
    t.string "title", null: false
    t.text "content", null: false
    t.text "reword"
    t.string "img"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_themes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: "", null: false
    t.string "address", default: "", null: false
    t.boolean "admin", default: false, null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "favorites", "themes"
  add_foreign_key "favorites", "users"
  add_foreign_key "ideas", "themes"
  add_foreign_key "ideas", "users"
  add_foreign_key "labellings", "labels"
  add_foreign_key "labellings", "themes"
  add_foreign_key "themes", "users"
end
