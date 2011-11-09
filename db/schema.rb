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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110811210537) do

  create_table "acts", :force => true do |t|
    t.integer  "game_id",       :null => false
    t.integer  "user_id"
    t.integer  "card_state_id", :null => false
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "act_type",      :null => false
  end

  create_table "card_states", :force => true do |t|
    t.integer "deck_id",                      :null => false
    t.integer "user_id"
    t.integer "card_id",                      :null => false
    t.integer "position"
    t.string  "status",   :default => "draw", :null => false
  end

  create_table "cards", :force => true do |t|
    t.integer "deck_id"
    t.text    "text"
    t.integer "template_id"
  end

  create_table "decks", :force => true do |t|
    t.integer "game_id"
    t.string  "name"
  end

  create_table "games", :force => true do |t|
    t.string   "title"
    t.integer  "host_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", :force => true do |t|
    t.integer "user_id",                             :null => false
    t.integer "deck_id",                             :null => false
    t.boolean "can_draw",         :default => true
    t.boolean "can_draw_to_hand", :default => true
    t.boolean "can_shuffle",      :default => false
    t.boolean "can_give",         :default => false
  end

  create_table "players_games", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "game_id"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "templates", :force => true do |t|
    t.string  "name"
    t.integer "user_id"
    t.boolean "public",  :default => true
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
