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

ActiveRecord::Schema[7.1].define(version: 2024_03_22_180658) do
  create_table "attendants", force: :cascade do |t|
    t.integer "student_id", null: false
    t.integer "course_id", null: false
    t.date "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_attendants_on_course_id"
    t.index ["student_id"], name: "index_attendants_on_student_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.integer "ects", limit: 1
    t.boolean "egzam"
    t.integer "field_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["field_id"], name: "index_courses_on_field_id"
  end

  create_table "courses_groups", id: false, force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "group_id", null: false
  end

  create_table "fields", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades", id: false, force: :cascade do |t|
    t.integer "course_id", null: false
    t.integer "student_id", null: false
    t.decimal "grade", precision: 4, scale: 1
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.string "shortname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "field_id"
    t.index ["field_id"], name: "index_groups_on_field_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "sname"
    t.string "indeks", limit: 5
    t.integer "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_students_on_group_id"
  end

  add_foreign_key "attendants", "courses"
  add_foreign_key "attendants", "students"
  add_foreign_key "courses", "fields"
  add_foreign_key "groups", "fields"
  add_foreign_key "students", "groups"
end
