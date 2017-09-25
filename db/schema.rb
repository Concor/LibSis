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

ActiveRecord::Schema.define(version: 20170919144835) do

  create_table "books", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "library_id"
    t.text "name"
    t.text "author"
    t.string "cipher", limit: 100
    t.string "publ"
    t.integer "publ_y"
    t.float "price", limit: 24
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_books_on_library_id"
  end

  create_table "issues", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "book_id"
    t.bigint "subscriber_id"
    t.date "d_start"
    t.date "d_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_issues_on_book_id"
    t.index ["subscriber_id"], name: "index_issues_on_subscriber_id"
  end

  create_table "libraries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "number"
    t.text "name"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
  end

  create_table "subscribers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "library_id"
    t.integer "number"
    t.string "fname"
    t.string "sname"
    t.string "mname"
    t.text "address"
    t.bigint "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["library_id"], name: "index_subscribers_on_library_id"
  end

  create_table "workers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "library_id"
    t.string "sname"
    t.string "fname"
    t.date "birthday"
    t.date "start_date"
    t.string "post"
    t.string "education"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "avatar"
    t.string "mname"
    t.index ["library_id"], name: "index_workers_on_library_id"
  end

  add_foreign_key "books", "libraries"
  add_foreign_key "issues", "books"
  add_foreign_key "issues", "subscribers"
  add_foreign_key "subscribers", "libraries"
  add_foreign_key "workers", "libraries"
end
