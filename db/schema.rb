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

ActiveRecord::Schema.define(version: 20150812040325) do

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

  create_table "comments", force: true do |t|
    t.string   "title",            limit: 50, default: ""
    t.text     "comment"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.integer  "user_id"
    t.string   "role",                        default: "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id"
  add_index "comments", ["commentable_type"], name: "index_comments_on_commentable_type"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

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
    t.string   "image_url"
    t.string   "avatar"
    t.string   "idea_tags"
  end

  add_index "idea_briefs", ["user_id"], name: "index_idea_briefs_on_user_id"

  create_table "idea_links", force: true do |t|
    t.integer  "idea_id"
    t.integer  "idea_linked_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "link_type"
    t.integer  "request_flag"
  end

  add_index "idea_links", ["idea_id", "idea_linked_id", "user_id"], name: "index_idea_links_on_idea_id_and_idea_linked_id_and_user_id", unique: true
  add_index "idea_links", ["idea_id"], name: "index_idea_links_on_idea_id"
  add_index "idea_links", ["idea_linked_id"], name: "index_idea_links_on_idea_linked_id"
  add_index "idea_links", ["link_type"], name: "index_idea_links_on_link_type"

  create_table "idea_surveys", force: true do |t|
    t.integer  "idea_id"
    t.integer  "survey_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "idea_surveys", ["idea_id", "survey_id"], name: "index_idea_surveys_on_idea_id_and_survey_id", unique: true
  add_index "idea_surveys", ["idea_id"], name: "index_idea_surveys_on_idea_id"
  add_index "idea_surveys", ["survey_id"], name: "index_idea_surveys_on_survey_id"

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
    t.integer  "privacy_flag",  limit: 255
    t.integer  "idea_brief_id"
  end

  add_index "ideas", ["idea_brief_id"], name: "index_ideas_on_idea_brief_id"
  add_index "ideas", ["privacy_flag"], name: "index_ideas_on_privacy_flag"
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

  create_table "milestones", force: true do |t|
    t.integer  "idea_id"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "progress"
    t.string   "title"
    t.text     "detail"
    t.boolean  "critical_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "milestones", ["idea_id"], name: "index_milestones_on_idea_id"

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
    t.string   "desc"
  end

  create_table "survey_answers", force: true do |t|
    t.integer  "attempt_id"
    t.integer  "question_id"
    t.integer  "option_id"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_attempts", force: true do |t|
    t.integer "participant_id"
    t.string  "participant_type"
    t.integer "survey_id"
    t.boolean "winner"
    t.integer "score"
  end

  create_table "survey_options", force: true do |t|
    t.integer  "question_id"
    t.integer  "weight",      default: 0
    t.string   "text"
    t.boolean  "correct"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_questions", force: true do |t|
    t.integer  "survey_id"
    t.string   "text"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "survey_surveys", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "attempts_number", default: 0
    t.boolean  "finished",        default: false
    t.boolean  "active",          default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"

  create_table "tags", force: true do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true

  create_table "team_requests", force: true do |t|
    t.integer  "team_id"
    t.integer  "user_id"
    t.integer  "requester_id"
    t.integer  "approver_id"
    t.integer  "action"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
    t.string   "requester_comment"
    t.string   "approver_comment"
  end

  add_index "team_requests", ["team_id", "user_id", "role_id"], name: "index_team_requests_on_team_id_and_user_id_and_role_id", unique: true

  create_table "teams", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_url"
  end

  add_index "teams", ["user_id"], name: "index_teams_on_user_id"

  create_table "theme_ideas", force: true do |t|
    t.integer  "theme_id"
    t.integer  "idea_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "link_type"
  end

  add_index "theme_ideas", ["idea_id"], name: "index_theme_ideas_on_idea_id"
  add_index "theme_ideas", ["link_type"], name: "index_theme_ideas_on_link_type"
  add_index "theme_ideas", ["theme_id"], name: "index_theme_ideas_on_theme_id"

  create_table "themes", force: true do |t|
    t.string   "title"
    t.string   "reward"
    t.string   "policy"
    t.integer  "type"
    t.integer  "privacy_flag"
    t.datetime "start_time"
    t.datetime "end_time"
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "detail"
  end

  add_index "themes", ["privacy_flag"], name: "index_themes_on_privacy_flag"
  add_index "themes", ["team_id"], name: "index_themes_on_team_id"
  add_index "themes", ["user_id"], name: "index_themes_on_user_id"

  create_table "user_team_roles", force: true do |t|
    t.integer  "team_id"
    t.integer  "role_id"
    t.string   "desc"
    t.boolean  "open_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role_name"
    t.integer  "open_number"
  end

  add_index "user_team_roles", ["team_id", "role_id"], name: "index_user_team_roles_on_team_id_and_role_id", unique: true
  add_index "user_team_roles", ["team_id"], name: "index_user_team_roles_on_team_id"

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
