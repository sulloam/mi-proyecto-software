# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_10_06_011610) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chats", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_chats_on_course_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "mode"
    t.string "start_date"
    t.string "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses_users", id: false, force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "user_id", null: false
  end

  create_table "materials", force: :cascade do |t|
    t.string "title"
    t.text "information"
    t.integer "number"
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_materials_on_course_id"
  end

  create_table "professors", force: :cascade do |t|
    t.string "grado"
    t.bigint "course_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_professors_on_course_id"
    t.index ["user_id"], name: "index_professors_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "statement"
    t.float "score"
    t.float "obtained_score"
    t.text "answer"
    t.bigint "test_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["test_id"], name: "index_questions_on_test_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "finished"
    t.bigint "course_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_students_on_course_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "course_id", null: false
    t.bigint "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_tests_on_course_id"
    t.index ["student_id"], name: "index_tests_on_student_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "chats", "courses"
  add_foreign_key "materials", "courses"
  add_foreign_key "professors", "courses"
  add_foreign_key "professors", "users"
  add_foreign_key "questions", "tests"
  add_foreign_key "students", "courses"
  add_foreign_key "students", "users"
  add_foreign_key "tests", "courses"
  add_foreign_key "tests", "students"
end
