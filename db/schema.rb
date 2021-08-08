# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_08_01_160836) do

  create_table "active_storage_attachments", charset: "utf8mb4", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "behaviors", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "patient_id"
    t.string "smoking"
    t.string "drinking"
    t.string "exercise_habits"
    t.string "breakfast"
    t.string "sleeping"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "patients", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.integer "sex"
    t.string "email"
    t.string "phone_number"
    t.bigint "number"
    t.date "birthday"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "records", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "patient_id"
    t.text "subjective"
    t.text "objective"
    t.text "assessment"
    t.text "plan"
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "results", charset: "utf8mb4", force: :cascade do |t|
    t.bigint "patient_id"
    t.integer "height"
    t.integer "body_weight"
    t.integer "systolic_blood_pressure"
    t.integer "diastolic_blood_pressure"
    t.integer "abdominal_circumference"
    t.integer "fat_percentage"
    t.integer "wbc"
    t.integer "rbc"
    t.integer "hb"
    t.integer "haematocrit"
    t.integer "t_cho"
    t.integer "hdl_cho"
    t.integer "ldl_cho"
    t.integer "tg"
    t.integer "ast"
    t.integer "alt"
    t.integer "gamma_gtp"
    t.integer "alp"
    t.integer "t_bil"
    t.integer "bun"
    t.integer "creatinine"
    t.integer "ua"
    t.integer "bs"
    t.decimal "hba1c", precision: 10
    t.decimal "e_gfr", precision: 10
    t.integer "tp"
    t.integer "lap"
    t.decimal "che", precision: 10
    t.decimal "serum_amylase", precision: 10
    t.decimal "fe", precision: 10
    t.decimal "hcv", precision: 10
    t.decimal "cea", precision: 10
    t.decimal "crp", precision: 10
    t.decimal "mcv", precision: 10
    t.decimal "mch", precision: 10
    t.decimal "mchc", precision: 10
    t.text "note"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean "allow_password_change", default: false
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.text "tokens"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
end
