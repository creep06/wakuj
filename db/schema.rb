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

ActiveRecord::Schema.define(version: 2018_12_05_034654) do

  create_table "accepteds", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "problem_id"
  end

  create_table "problems", force: :cascade do |t|
    t.string "name"
    t.text "statement"
    t.integer "point"
    t.integer "time_limit"
    t.integer "memory_limit"
    t.integer "solved_count", default: 0
    t.integer "submitted_count", default: 0
    t.integer "ac_count", default: 0
    t.integer "testcases_count"
    t.boolean "secret", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "constraint"
    t.text "sample1i"
    t.text "sample1o"
    t.text "sample2i"
    t.text "sample2o"
    t.text "sample3i"
    t.text "sample3o"
    t.text "sample4i"
    t.text "sample4o"
    t.text "sample5i"
    t.text "sample5o"
    t.text "sample6i"
    t.text "sample6o"
    t.text "sample7i"
    t.text "sample7o"
    t.text "sample8i"
    t.text "sample8o"
    t.text "sample9i"
    t.text "sample9o"
    t.text "sample10i"
    t.text "sample10o"
    t.text "input_desc"
    t.text "output_desc"
  end

  create_table "results", force: :cascade do |t|
    t.string "name"
    t.string "verdict"
    t.integer "time"
    t.integer "memory"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "submission_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.text "code"
    t.string "language"
    t.integer "point"
    t.integer "length"
    t.string "verdict", default: "Pending"
    t.integer "time", default: 0
    t.integer "memory", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "problem_id"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false
    t.integer "point", default: 0
    t.integer "solved", default: 0
    t.integer "submitted", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
