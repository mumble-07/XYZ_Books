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

ActiveRecord::Schema[7.0].define(version: 2024_03_19_022041) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authors", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.integer "book_id"
  end

  create_table "book_author", id: false, force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "author_id", null: false
    t.index ["author_id"], name: "index_book_author_on_author_id"
    t.index ["book_id", "author_id"], name: "index_book_author_on_book_id_and_author_id", unique: true
    t.index ["book_id"], name: "index_book_author_on_book_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "isbn_10"
    t.string "isbn_13"
    t.integer "list_price"
    t.string "publication_year"
    t.string "edition"
    t.string "image_url"
    t.integer "publisher_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "book_author", "authors"
  add_foreign_key "book_author", "books"
end
