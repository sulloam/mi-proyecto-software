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

ActiveRecord::Schema[7.1].define(version: 2024_11_16_221141) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "student_response_id", null: false
    t.bigint "evaluation_question_id", null: false
    t.bigint "option_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["evaluation_question_id"], name: "index_answers_on_evaluation_question_id"
    t.index ["option_id"], name: "index_answers_on_option_id"
    t.index ["student_response_id"], name: "index_answers_on_student_response_id"
  end

  create_table "chats", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_chats_on_course_id"
  end

  create_table "course_reviews", force: :cascade do |t|
    t.integer "score"
    t.text "comment"
    t.bigint "student_id", null: false
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_course_reviews_on_course_id"
    t.index ["student_id"], name: "index_course_reviews_on_student_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "mode"
    t.string "start_date"
    t.string "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.integer "professor_id"
    t.string "code"
    t.integer "total_vacancies"
  end

  create_table "courses_users", id: false, force: :cascade do |t|
    t.bigint "course_id", null: false
    t.bigint "user_id", null: false
  end

  create_table "enrollments", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "course_id", null: false
    t.string "status", default: "pendiente"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_enrollments_on_course_id"
    t.index ["user_id", "course_id"], name: "index_enrollments_on_user_id_and_course_id", unique: true
    t.index ["user_id"], name: "index_enrollments_on_user_id"
  end

  create_table "evaluation_questions", force: :cascade do |t|
    t.string "content"
    t.bigint "evaluation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "correct_option"
    t.index ["evaluation_id"], name: "index_evaluation_questions_on_evaluation_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_evaluations_on_course_id"
  end

  create_table "materials", force: :cascade do |t|
    t.string "title"
    t.text "information"
    t.integer "number"
    t.bigint "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "embed_url"
    t.index ["course_id"], name: "index_materials_on_course_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "info"
    t.bigint "chat_id", null: false
    t.bigint "student_id", null: false
    t.bigint "professor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["professor_id"], name: "index_messages_on_professor_id"
    t.index ["student_id"], name: "index_messages_on_student_id"
  end

  create_table "options", force: :cascade do |t|
    t.string "content"
    t.bigint "evaluation_question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "correct"
    t.index ["evaluation_question_id"], name: "index_options_on_evaluation_question_id"
  end

  create_table "professor_reviews", force: :cascade do |t|
    t.integer "score"
    t.text "comment"
    t.bigint "student_id", null: false
    t.bigint "professor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["professor_id"], name: "index_professor_reviews_on_professor_id"
    t.index ["student_id"], name: "index_professor_reviews_on_student_id"
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

  create_table "student_responses", force: :cascade do |t|
    t.bigint "evaluation_id", null: false
    t.bigint "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "score"
    t.index ["evaluation_id"], name: "index_student_responses_on_evaluation_id"
    t.index ["student_id"], name: "index_student_responses_on_student_id"
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
    t.string "photo"
    t.text "description"
    t.string "rol"
    t.string "phone_number"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "answers", "evaluation_questions"
  add_foreign_key "answers", "options"
  add_foreign_key "answers", "student_responses"
  add_foreign_key "chats", "courses"
  add_foreign_key "course_reviews", "courses"
  add_foreign_key "course_reviews", "students"
  add_foreign_key "enrollments", "courses"
  add_foreign_key "enrollments", "users"
  add_foreign_key "evaluation_questions", "evaluations"
  add_foreign_key "evaluations", "courses"
  add_foreign_key "materials", "courses"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "professors"
  add_foreign_key "messages", "students"
  add_foreign_key "options", "evaluation_questions"
  add_foreign_key "professor_reviews", "professors"
  add_foreign_key "professor_reviews", "students"
  add_foreign_key "professors", "courses"
  add_foreign_key "professors", "users"
  add_foreign_key "questions", "tests"
  add_foreign_key "student_responses", "evaluations"
  add_foreign_key "student_responses", "users", column: "student_id"
  add_foreign_key "students", "courses"
  add_foreign_key "students", "users"
  add_foreign_key "tests", "courses"
  add_foreign_key "tests", "students"
end
