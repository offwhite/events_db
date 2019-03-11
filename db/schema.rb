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

ActiveRecord::Schema.define(version: 20190311154127) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.text "name"
    t.text "iso"
    t.text "language"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "event_types", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.text "name"
    t.date "date"
    t.bigint "event_type_id"
    t.bigint "venue_id"
    t.bigint "tour_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.boolean "verified"
    t.index ["event_type_id"], name: "index_events_on_event_type_id"
    t.index ["name", "date", "venue_id"], name: "index_events_on_name_and_date_and_venue_id", unique: true
    t.index ["tour_id"], name: "index_events_on_tour_id"
    t.index ["user_id"], name: "index_events_on_user_id"
    t.index ["venue_id"], name: "index_events_on_venue_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.text "name"
    t.text "biography"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "verified"
    t.boolean "validated"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "role_departments", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "role_types", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "category"
  end

  create_table "roles", force: :cascade do |t|
    t.bigint "profile_id"
    t.bigint "event_id"
    t.bigint "role_type_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "verified"
    t.integer "creator_id"
    t.integer "tour_id"
    t.integer "role_department_id"
    t.index ["event_id"], name: "index_roles_on_event_id"
    t.index ["profile_id", "role_type_id", "event_id"], name: "index_roles_on_profile_id_and_role_type_id_and_event_id", unique: true
    t.index ["profile_id"], name: "index_roles_on_profile_id"
    t.index ["role_type_id"], name: "index_roles_on_role_type_id"
  end

  create_table "tour_types", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tours", force: :cascade do |t|
    t.text "name"
    t.bigint "tour_type_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "verified"
    t.index ["tour_type_id"], name: "index_tours_on_tour_type_id"
    t.index ["user_id"], name: "index_tours_on_user_id"
  end

  create_table "towns", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["country_id"], name: "index_towns_on_country_id"
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
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "permission_level", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "venues", force: :cascade do |t|
    t.text "name"
    t.text "description"
    t.text "address"
    t.bigint "town_id"
    t.integer "capacity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.text "url"
    t.text "phone"
    t.boolean "verified"
    t.index ["town_id"], name: "index_venues_on_town_id"
  end

end
