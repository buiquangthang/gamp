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

ActiveRecord::Schema.define(version: 20170424032636) do

  create_table "bus_routes", force: :cascade do |t|
    t.string   "name"
    t.integer  "bus_type"
    t.text     "list_places", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["name", "bus_type"], name: "index_bus_routes_on_name_and_bus_type", unique: true
  end

  create_table "distances", force: :cascade do |t|
    t.integer  "origin"
    t.integer  "destination"
    t.float    "distance_metter"
    t.integer  "bus_route_id"
    t.text     "route"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["destination"], name: "index_distances_on_destination"
    t.index ["origin", "destination", "bus_route_id"], name: "index_distances_on_origin_and_destination_and_bus_route_id", unique: true
    t.index ["origin"], name: "index_distances_on_origin"
  end

  create_table "graph_nodes", force: :cascade do |t|
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

  create_table "list_nodes", force: :cascade do |t|
    t.integer  "bus_route_id"
    t.text     "list"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["bus_route_id"], name: "index_list_nodes_on_bus_route_id"
  end

  create_table "nodes", force: :cascade do |t|
    t.integer  "bus_route_id"
    t.integer  "place_id"
    t.time     "arrival_time"
    t.integer  "list_node_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["bus_route_id"], name: "index_nodes_on_bus_route_id"
    t.index ["list_node_id"], name: "index_nodes_on_list_node_id"
    t.index ["place_id"], name: "index_nodes_on_place_id"
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
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
