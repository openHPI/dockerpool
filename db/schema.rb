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

ActiveRecord::Schema.define(version: 20161207163734) do

  create_table "consumers", force: :cascade do |t|
    t.string   "name"
    t.string   "oauth_secret"
    t.string   "oauth_session_key"
    t.datetime "oauth_session_expires"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "oauth_key"
  end

  create_table "consumers_pools", id: false, force: :cascade do |t|
    t.integer "pool_id",     null: false
    t.integer "consumer_id", null: false
  end

  add_index "consumers_pools", ["consumer_id", "pool_id"], name: "index_consumers_pools_on_consumer_id_and_pool_id"
  add_index "consumers_pools", ["pool_id", "consumer_id"], name: "index_consumers_pools_on_pool_id_and_consumer_id"

  create_table "containers", force: :cascade do |t|
    t.string   "docker_id"
    t.datetime "blocked_since"
    t.integer  "consumer_id"
    t.integer  "usages"
    t.integer  "runtime"
    t.boolean  "active"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "daemon_id"
    t.integer  "pool_id"
  end

  add_index "containers", ["consumer_id"], name: "index_containers_on_consumer_id"
  add_index "containers", ["daemon_id"], name: "index_containers_on_daemon_id"
  add_index "containers", ["pool_id"], name: "index_containers_on_pool_id"

  create_table "daemons", force: :cascade do |t|
    t.string   "ip"
    t.integer  "port"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pools", force: :cascade do |t|
    t.string   "image"
    t.integer  "min"
    t.integer  "max"
    t.integer  "max_runtime"
    t.integer  "max_usages"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "daemon_id"
    t.integer  "memory_limit"
    t.boolean  "network_enabled"
    t.string   "exposed_ports"
  end

  add_index "pools", ["daemon_id"], name: "index_pools_on_daemon_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
