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

ActiveRecord::Schema[7.1].define(version: 2023_11_12_233346) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "legal_cases", force: :cascade do |t|
    t.string "cnj_number"
    t.string "party_names"
    t.string "origin_court"
    t.date "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movements", force: :cascade do |t|
    t.bigint "legal_case_id", null: false
    t.date "date"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["legal_case_id"], name: "index_movements_on_legal_case_id"
  end

  add_foreign_key "movements", "legal_cases"
end
