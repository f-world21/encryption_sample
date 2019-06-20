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

ActiveRecord::Schema.define(version: 2019_06_20_082609) do

  create_table "personal_info_hashes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "personal_info_id"
    t.string "field_name"
    t.string "hash_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hash_value"], name: "index_personal_info_hashes_on_hash_value"
    t.index ["personal_info_id", "field_name"], name: "index_personal_info_hashes_on_personal_info_id_and_field_name", unique: true
    t.index ["personal_info_id"], name: "index_personal_info_hashes_on_personal_info_id"
  end

  create_table "personal_infos", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "encrypted_first_name"
    t.string "encrypted_first_name_iv"
    t.string "encrypted_last_name"
    t.string "encrypted_last_name_iv"
    t.string "encrypted_first_name_read"
    t.string "encrypted_first_name_read_iv"
    t.string "encrypted_last_name_read"
    t.string "encrypted_last_name_read_iv"
    t.string "encrypted_date_of_birth"
    t.string "encrypted_date_of_birth_iv"
    t.string "encrypted_gender"
    t.string "encrypted_gender_iv"
    t.string "encrypted_postal_code"
    t.string "encrypted_postal_code_iv"
    t.string "encrypted_address"
    t.string "encrypted_address_iv"
    t.string "encrypted_tel"
    t.string "encrypted_tel_iv"
    t.binary "encrypted_data_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "personal_info_hashes", "personal_infos"
end
