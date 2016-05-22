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

ActiveRecord::Schema.define(version: 20160522130656) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "battle_members", force: :cascade do |t|
    t.integer  "battle_id"
    t.integer  "battle_member_id"
    t.string   "battle_member_type"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "battle_members", ["battle_id"], name: "index_battle_members_on_battle_id", using: :btree
  add_index "battle_members", ["battle_member_id"], name: "index_battle_members_on_battle_member_id", using: :btree

  create_table "battles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "challenge_members", force: :cascade do |t|
    t.integer  "challenge_id"
    t.integer  "challenge_member_id"
    t.string   "challenge_member_type"
    t.boolean  "completed"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "challenge_members", ["challenge_id"], name: "index_challenge_members_on_challenge_id", using: :btree
  add_index "challenge_members", ["challenge_member_id"], name: "index_challenge_members_on_challenge_member_id", using: :btree

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

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "group_id"
    t.integer "user_id"
  end

  add_index "groups_users", ["group_id"], name: "index_groups_users_on_group_id", using: :btree
  add_index "groups_users", ["user_id"], name: "index_groups_users_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "challenges", "users", column: "owner_id"
end
