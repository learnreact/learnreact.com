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

ActiveRecord::Schema.define(version: 20180125092527) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "hidden"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "free", default: false, null: false
    t.boolean "incomplete"
    t.string "duration"
    t.index ["slug"], name: "index_courses_on_slug"
  end

  create_table "lessons", force: :cascade do |t|
    t.bigint "course_id"
    t.string "title"
    t.text "description"
    t.text "video_embed"
    t.boolean "free"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "transcript"
    t.index ["course_id"], name: "index_lessons_on_course_id"
    t.index ["slug"], name: "index_lessons_on_slug"
  end

  create_table "purchases", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "charge_token"
    t.index ["course_id"], name: "index_purchases_on_course_id"
    t.index ["user_id"], name: "index_purchases_on_user_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.bigint "user_id"
    t.string "subscription_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_subscriptions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider"
    t.integer "provider_id"
    t.string "name"
    t.string "nickname"
    t.string "email"
    t.string "avatar_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "customer_token"
  end

  add_foreign_key "lessons", "courses"
  add_foreign_key "purchases", "courses"
  add_foreign_key "purchases", "users"
  add_foreign_key "subscriptions", "users"
end
