# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150824144912) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "event_date"
    t.string   "location"
    t.string   "longitud"
    t.string   "latitud"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "guests", force: :cascade do |t|
    t.string   "name"
    t.integer  "event_id"
    t.string   "access_hash"
    t.string   "email"
    t.boolean  "notified"
    t.boolean  "attending"
    t.text     "requirements"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "guests", ["email", "event_id"], name: "index_guests_on_email_and_event_id", unique: true, using: :btree
  add_index "guests", ["event_id"], name: "index_guests_on_event_id", using: :btree

  create_table "rsvp_option_values", force: :cascade do |t|
    t.string   "value"
    t.integer  "rsvp_option_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "rsvp_option_values", ["rsvp_option_id"], name: "index_rsvp_option_values_on_rsvp_option_id", using: :btree

  create_table "rsvp_options", force: :cascade do |t|
    t.string   "option_name"
    t.integer  "event_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "rsvp_options", ["event_id"], name: "index_rsvp_options_on_event_id", using: :btree

  create_table "sections", force: :cascade do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "sort_order"
  end

  add_index "sections", ["event_id"], name: "index_sections_on_event_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "events", "users"
  add_foreign_key "guests", "events"
  add_foreign_key "rsvp_option_values", "rsvp_options"
  add_foreign_key "rsvp_options", "events"
  add_foreign_key "sections", "events"
end
