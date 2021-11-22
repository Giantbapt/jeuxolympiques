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

ActiveRecord::Schema.define(version: 2021_11_22_141912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "athletes", force: :cascade do |t|
    t.string "name"
    t.string "nationality"
    t.string "sports", array: true
    t.integer "number_of_medals"
    t.integer "gold"
    t.integer "silver"
    t.integer "bronze"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "editions", force: :cascade do |t|
    t.string "name"
    t.string "year"
    t.string "place"
    t.string "slug"
    t.string "logo"
    t.string "season"
    t.integer "number_of_medals"
    t.integer "number_of_athletes"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "participations", force: :cascade do |t|
    t.bigint "edition_id"
    t.bigint "athlete_id"
    t.string "sport"
    t.integer "number_of_medals"
    t.integer "gold"
    t.integer "silver"
    t.integer "bronze"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["athlete_id"], name: "index_participations_on_athlete_id"
    t.index ["edition_id"], name: "index_participations_on_edition_id"
  end

  add_foreign_key "participations", "athletes"
  add_foreign_key "participations", "editions"
end
