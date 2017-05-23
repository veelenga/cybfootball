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

ActiveRecord::Schema.define(version: 20170219221637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "faqs", force: :cascade do |t|
    t.string   "question"
    t.text     "answer"
    t.integer  "order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "goals", force: :cascade do |t|
    t.integer  "kind",       default: 0
    t.integer  "player_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "match_id"
    t.integer  "team_id"
    t.index ["match_id"], name: "index_goals_on_match_id", using: :btree
    t.index ["player_id"], name: "index_goals_on_player_id", using: :btree
    t.index ["team_id"], name: "index_goals_on_team_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.integer  "tournament_id"
    t.string   "name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["tournament_id"], name: "index_groups_on_tournament_id", using: :btree
  end

  create_table "groups_teams", id: false, force: :cascade do |t|
    t.integer "group_id"
    t.integer "team_id"
  end

  create_table "matches", force: :cascade do |t|
    t.integer  "home_team_id"
    t.integer  "guest_team_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "group_id"
    t.index ["group_id"], name: "index_matches_on_group_id", using: :btree
    t.index ["guest_team_id"], name: "index_matches_on_guest_team_id", using: :btree
    t.index ["home_team_id"], name: "index_matches_on_home_team_id", using: :btree
  end

  create_table "pages", force: :cascade do |t|
    t.string   "path"
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string   "fio"
    t.text     "bio"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "graduation_year"
    t.string   "degree"
    t.index ["fio"], name: "index_players_on_fio", using: :btree
  end

  create_table "players_teams", id: false, force: :cascade do |t|
    t.integer "player_id"
    t.integer "team_id"
    t.index ["player_id"], name: "index_players_teams_on_player_id", using: :btree
    t.index ["team_id"], name: "index_players_teams_on_team_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.index ["name"], name: "index_teams_on_name", using: :btree
  end

  create_table "tournaments", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.date     "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "trail_players", force: :cascade do |t|
    t.string   "fio"
    t.text     "bio"
    t.integer  "graduation_year"
    t.string   "degree"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "player_id"
    t.index ["player_id"], name: "index_trail_players_on_player_id", using: :btree
  end

  create_table "trail_teams", force: :cascade do |t|
    t.string   "name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "team_id"
    t.index ["team_id"], name: "index_trail_teams_on_team_id", using: :btree
  end

  create_table "trail_tournaments", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.date     "date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "tournament_id"
    t.index ["tournament_id"], name: "index_trail_tournaments_on_tournament_id", using: :btree
  end

  create_table "trails_players", force: :cascade do |t|
    t.string   "fio"
    t.text     "bio"
    t.integer  "graduation_year"
    t.string   "degree"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "trails_team", force: :cascade do |t|
    t.string   "name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "trails_tournament", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.date     "date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "login",               default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "role"
    t.index ["login"], name: "index_users_on_login", unique: true, using: :btree
  end

  add_foreign_key "trail_players", "players"
  add_foreign_key "trail_teams", "teams"
  add_foreign_key "trail_tournaments", "tournaments"
end
