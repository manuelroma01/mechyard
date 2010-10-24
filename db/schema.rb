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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101024221321) do

  create_table "battle_mechs", :force => true do |t|
    t.string   "code",           :limit => 10, :null => false
    t.string   "name",           :limit => 30, :null => false
    t.integer  "mass",                         :null => false
    t.string   "chassis"
    t.string   "power_plant"
    t.string   "jump_jets"
    t.string   "armor"
    t.string   "comm_system"
    t.string   "tt_system"
    t.string   "manufacturer"
    t.integer  "cruising_speed"
    t.integer  "maximum_speed"
    t.integer  "jump_capacity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "systems", :force => true do |t|
    t.integer  "battle_mech_id"
    t.integer  "system_type_id"
    t.integer  "location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
