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

ActiveRecord::Schema.define(version: 20171105125412) do

  create_table "ar_internal_metadata", primary_key: "key", force: :cascade do |t|
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "ar_internal_metadata", ["key"], name: "sqlite_autoindex_ar_internal_metadata_1", unique: true

  create_table "cuestionarios", force: :cascade do |t|
    t.integer "idcuestionario"
    t.string  "name"
    t.float   "nota"
  end

  create_table "estadisticas", force: :cascade do |t|
    t.string  "name"
    t.integer "aprobados"
    t.integer "realizados"
    t.integer "suspensos"
    t.float   "media"
    t.float   "porcentajeaprobados"
    t.float   "porcentajeasuspensos"
  end

  create_table "resultados", force: :cascade do |t|
    t.integer "idcuestionario"
    t.integer "npreguntas"
    t.float   "notaaprobar"
    t.float   "notamaxima"
  end

  create_table "users", force: :cascade do |t|
    t.string  "name"
    t.string  "email"
    t.string  "password_digest"
    t.boolean "instructor"
  end

end
