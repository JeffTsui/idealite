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

ActiveRecord::Schema.define(version: 20150702045651) do

  create_table "activities", force: true do |t|
    t.integer  "trackable_id"
    t.string   "trackable_type"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.string   "key"
    t.text     "parameters"
    t.integer  "recipient_id"
    t.string   "recipient_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "activities", ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type"
  add_index "activities", ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type"
  add_index "activities", ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type"

  create_table "dictionaries", force: true do |t|
    t.string   "table_name"
    t.string   "column_name"
    t.integer  "value"
    t.string   "descriptiopn"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "follows", force: true do |t|
    t.string   "follower_type"
    t.integer  "follower_id"
    t.string   "followable_type"
    t.integer  "followable_id"
    t.datetime "created_at"
  end

  add_index "follows", ["followable_id", "followable_type"], name: "fk_followables"
  add_index "follows", ["follower_id", "follower_type"], name: "fk_follows"

  create_table "friendships", force: true do |t|
    t.integer "friendable_id"
    t.integer "friend_id"
    t.integer "blocker_id"
    t.boolean "pending",       default: true
  end

  add_index "friendships", ["friendable_id", "friend_id"], name: "index_friendships_on_friendable_id_and_friend_id", unique: true

  create_table "idea_briefs", force: true do |t|
    t.string   "title"
    t.string   "problem"
    t.string   "target"
    t.string   "how"
    t.string   "result"
    t.string   "risk"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "short_desc"
  end

  create_table "idea_teams", force: true do |t|
    t.integer  "idea_id"
    t.integer  "team_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "idea_teams", ["idea_id"], name: "index_idea_teams_on_idea_id"
  add_index "idea_teams", ["team_id"], name: "index_idea_teams_on_team_id"

  create_table "ideas", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "privacy_flag"
    t.integer  "idea_brief_id"
  end

  add_index "ideas", ["idea_brief_id"], name: "index_ideas_on_idea_brief_id"
  add_index "ideas", ["user_id"], name: "index_ideas_on_user_id"

  create_table "likes", force: true do |t|
    t.string   "liker_type"
    t.integer  "liker_id"
    t.string   "likeable_type"
    t.integer  "likeable_id"
    t.datetime "created_at"
  end

  add_index "likes", ["likeable_id", "likeable_type"], name: "fk_likeables"
  add_index "likes", ["liker_id", "liker_type"], name: "fk_likes"

  create_table "mentions", force: true do |t|
    t.string   "mentioner_type"
    t.integer  "mentioner_id"
    t.string   "mentionable_type"
    t.integer  "mentionable_id"
    t.datetime "created_at"
  end

  add_index "mentions", ["mentionable_id", "mentionable_type"], name: "fk_mentionables"
  add_index "mentions", ["mentioner_id", "mentioner_type"], name: "fk_mentions"

  create_table "mercury_images", force: true do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "post_actors", force: true do |t|
    t.integer  "post_id"
    t.string   "post_actor_type"
    t.string   "post_actor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "post_actors", ["post_actor_id"], name: "index_post_actors_on_post_actor_id"
  add_index "post_actors", ["post_actor_type"], name: "index_post_actors_on_post_actor_type"
  add_index "post_actors", ["post_id"], name: "index_post_actors_on_post_id"

  create_table "posts", force: true do |t|
    t.integer  "idea_id"
    t.integer  "user_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["idea_id"], name: "index_posts_on_idea_id"
  add_index "posts", ["user_id"], name: "index_posts_on_user_id"

  create_table "profiles", force: true do |t|
    t.integer  "profile_id"
    t.string   "profile_type"
    t.string   "nickname"
    t.date     "birthday"
    t.string   "phone"
    t.string   "mobile"
    t.string   "fax"
    t.string   "address"
    t.string   "city"
    t.string   "province"
    t.string   "country"
    t.string   "zipcode"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "team_requests", force: true do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.integer  "requester_id"
    t.integer  "approver_id"
    t.integer  "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_teams", force: true do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image_url"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
