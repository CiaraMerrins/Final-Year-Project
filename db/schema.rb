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

ActiveRecord::Schema.define(version: 20160407104525) do

# Could not dump table "coaches" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "comments", force: true do |t|
    t.string   "name"
    t.text     "body"
    t.integer  "post_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "coach_id"
  end

  add_index "comments", ["coach_id"], name: "index_comments_on_coach_id"
  add_index "comments", ["post_id"], name: "index_comments_on_post_id"

  create_table "pins", force: true do |t|
    t.string   "title"
    t.text     "desciption"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "player_id"
  end

  add_index "pins", ["player_id"], name: "index_pins_on_player_id"

# Could not dump table "players" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "player_id"
    t.string   "status_type"
  end

  create_table "sports", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
