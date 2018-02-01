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

ActiveRecord::Schema.define(version: 20180131055209) do

  create_table "reserves", force: :cascade do |t|
    t.integer  "slot_id"
    t.integer  "vehicle_id"
    t.datetime "initTime"
    t.datetime "exitTime"
    t.integer  "totalTime"
    t.integer  "price"
    t.boolean  "busy",       default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["slot_id"], name: "index_reserves_on_slot_id"
    t.index ["vehicle_id"], name: "index_reserves_on_vehicle_id"
  end

  create_table "slots", force: :cascade do |t|
    t.string   "number"
    t.integer  "vehicle_type_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["vehicle_type_id"], name: "index_slots_on_vehicle_type_id"
  end

  create_table "vehicle_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vehicles", force: :cascade do |t|
    t.string   "patente"
    t.integer  "vehicle_type_id"
    t.string   "description"
    t.string   "phone"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["vehicle_type_id"], name: "index_vehicles_on_vehicle_type_id"
  end

end
