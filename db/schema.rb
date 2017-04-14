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

ActiveRecord::Schema.define(version: 20170411014826) do

  create_table "bus_routes", force: :cascade do |t|
    t.string   "name"
    t.integer  "bus_type"
    t.text     "list_places", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["name", "bus_type"], name: "index_bus_routes_on_name_and_bus_type", unique: true
  end

  create_table "distances", force: :cascade do |t|
    t.integer  "busstop_from"
    t.integer  "busstop_to"
    t.float    "distance_metter"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["busstop_from", "busstop_to"], name: "index_distances_on_busstop_from_and_busstop_to", unique: true
    t.index ["busstop_from"], name: "index_distances_on_busstop_from"
    t.index ["busstop_to"], name: "index_distances_on_busstop_to"
  end

  create_table "graph_nodes", force: :cascade do |t|
    t.text     "graph"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "place_routes", force: :cascade do |t|
    t.integer  "bus_route_id"
    t.integer  "place_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["bus_route_id"], name: "index_place_routes_on_bus_route_id"
    t.index ["place_id"], name: "index_place_routes_on_place_id"
  end

  create_table "places", force: :cascade do |t|
    t.float    "latitude"
    t.float    "longitude"
    t.string   "name"
    t.string   "address"
    t.string   "title"
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
