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

ActiveRecord::Schema.define(version: 20170510103759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bus_lines", force: :cascade do |t|
    t.string   "name"
    t.time     "operating_from"
    t.time     "operating_to"
    t.text     "in_charge_unit"
    t.integer  "ticket_fee"
    t.text     "description"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "bus_routes", force: :cascade do |t|
    t.string   "name"
    t.integer  "bus_type"
    t.text     "list_places"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["name", "bus_type"], name: "index_bus_routes_on_name_and_bus_type", unique: true, using: :btree
  end

  create_table "distances", force: :cascade do |t|
    t.integer  "origin"
    t.integer  "destination"
    t.float    "distance_metter"
    t.integer  "bus_route_id"
    t.text     "route"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["destination"], name: "index_distances_on_destination", using: :btree
    t.index ["origin", "destination", "bus_route_id"], name: "index_distances_on_origin_and_destination_and_bus_route_id", unique: true, using: :btree
    t.index ["origin"], name: "index_distances_on_origin", using: :btree
  end

  create_table "graph_time_nodes", force: :cascade do |t|
    t.text     "graph"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "links", force: :cascade do |t|
    t.integer  "origin"
    t.integer  "destination"
    t.float    "cost"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "list_time_nodes", force: :cascade do |t|
    t.integer  "bus_route_id"
    t.text     "list"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["bus_route_id"], name: "index_list_time_nodes_on_bus_route_id", using: :btree
  end

  create_table "place_routes", force: :cascade do |t|
    t.integer  "bus_route_id"
    t.integer  "place_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["bus_route_id"], name: "index_place_routes_on_bus_route_id", using: :btree
    t.index ["place_id"], name: "index_place_routes_on_place_id", using: :btree
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

  create_table "time_nodes", force: :cascade do |t|
    t.integer  "bus_route_id"
    t.integer  "place_id"
    t.time     "arrival_time"
    t.integer  "list_time_node_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.index ["bus_route_id"], name: "index_time_nodes_on_bus_route_id", using: :btree
    t.index ["list_time_node_id"], name: "index_time_nodes_on_list_time_node_id", using: :btree
    t.index ["place_id"], name: "index_time_nodes_on_place_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "list_time_nodes", "bus_routes"
  add_foreign_key "place_routes", "bus_routes"
  add_foreign_key "place_routes", "places"
  add_foreign_key "time_nodes", "bus_routes"
  add_foreign_key "time_nodes", "list_time_nodes"
  add_foreign_key "time_nodes", "places"
end
