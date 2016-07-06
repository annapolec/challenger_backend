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


ActiveRecord::Schema.define(version: 20160705201302) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "battle_members", force: :cascade do |t|
    t.integer  "battle_id"
    t.integer  "member_id"
    t.string   "member_type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "battle_members", ["battle_id"], name: "index_battle_members_on_battle_id", using: :btree
  add_index "battle_members", ["member_id"], name: "index_battle_members_on_member_id", using: :btree

  create_table "battles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "owner_id"
    t.boolean  "mode"
  end

  create_table "challenge_members", force: :cascade do |t|
    t.integer  "challenge_id"
    t.integer  "member_id"
    t.string   "member_type"
    t.boolean  "completed"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "challenge_members", ["challenge_id"], name: "index_challenge_members_on_challenge_id", using: :btree
  add_index "challenge_members", ["member_id"], name: "index_challenge_members_on_member_id", using: :btree

  create_table "challenges", force: :cascade do |t|
    t.string   "name"
    t.text     "desc"
    t.integer  "points"
    t.integer  "battle_id"
    t.boolean  "status"
    t.integer  "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "challenges", ["battle_id"], name: "index_challenges_on_battle_id", using: :btree
  add_index "challenges", ["owner_id"], name: "index_challenges_on_owner_id", using: :btree

  create_table "group_users", id: false, force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  add_index "group_users", ["group_id"], name: "index_group_users_on_group_id", using: :btree
  add_index "group_users", ["user_id"], name: "index_group_users_on_user_id", using: :btree

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "email",                  default: "", null: false
    t.string   "token"
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

  add_foreign_key "battles", "users", column: "owner_id"
  add_foreign_key "challenges", "users", column: "owner_id"
end
