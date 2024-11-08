ActiveRecord::Schema[7.2].define(version: 2024_11_08_174527) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversations", force: :cascade do |t|
    t.integer "user1_id", null: false
    t.integer "user2_id", null: false
    t.integer "pet_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user1_id", "user2_id"], name: "index_conversations_on_user1_id_and_user2_id", unique: true
  end

  create_table "messages", force: :cascade do |t|
    t.text "content", null: false
    t.integer "sender_id", null: false
    t.integer "receiver_id", null: false
    t.bigint "conversation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
  end

  create_table "pets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.string "name"
    t.string "breed"
    t.string "address"
    t.bigint "user_id", null: false
    t.string "image_url"
    t.float "latitude"
    t.float "longitude"
    t.string "city"
    t.date "start_date"
    t.date "end_date"
    t.index ["user_id"], name: "index_pets_on_user_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.date "start_date"
    t.date "end_date"
    t.bigint "user_id", null: false
    t.bigint "pet_id", null: false
    t.index ["pet_id"], name: "index_reservations_on_pet_id"
    t.index ["user_id"], name: "index_reservations_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "messages", "conversations"
  add_foreign_key "pets", "users"
  add_foreign_key "reservations", "pets"
  add_foreign_key "reservations", "users"
end
