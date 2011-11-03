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

ActiveRecord::Schema.define(:version => 20111029201302) do

  create_table "accounts", :force => true do |t|
    t.integer  "type"
    t.integer  "company_id"
    t.date     "due_date"
    t.string   "description"
    t.decimal  "value"
    t.string   "barcode"
    t.date     "payment_date"
    t.decimal  "interest"
    t.decimal  "discount"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "supplier_id"
    t.boolean  "payed",        :default => false
  end

  create_table "admin_users", :force => true do |t|
    t.string   "first_name",       :default => "",    :null => false
    t.string   "last_name",        :default => "",    :null => false
    t.string   "role",                                :null => false
    t.string   "email",                               :null => false
    t.boolean  "status",           :default => false
    t.string   "token",                               :null => false
    t.string   "salt",                                :null => false
    t.string   "crypted_password",                    :null => false
    t.string   "preferences"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true

  create_table "aircraft_types", :force => true do |t|
    t.string   "name"
    t.decimal  "hour_price", :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aircrafts", :force => true do |t|
    t.string   "prefix"
    t.string   "type"
    t.boolean  "owner",             :limit => 255
    t.string   "manufacturer"
    t.string   "model"
    t.string   "color"
    t.integer  "hourmeter"
    t.date     "maintenance_break"
    t.date     "last_maintenance"
    t.integer  "flyght_hours"
    t.string   "details"
    t.string   "equipment"
    t.string   "speed"
    t.string   "operator"
    t.integer  "aircraft_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "balances", :force => true do |t|
    t.integer  "client_id"
    t.datetime "date"
    t.integer  "flight_id"
    t.integer  "aircraft_type_id"
    t.float    "hours"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sale_id"
  end

  add_index "balances", ["client_id"], :name => "index_balances_on_client_id"
  add_index "balances", ["flight_id"], :name => "index_balances_on_flight_id"

  create_table "clients", :force => true do |t|
    t.string   "name"
    t.string   "cpf"
    t.string   "rg"
    t.string   "client_dac"
    t.date     "birthday"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "cep"
    t.string   "phone"
    t.string   "cel"
    t.string   "email"
    t.integer  "credit"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "debts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entries", :force => true do |t|
    t.date     "due_date"
    t.date     "entry_date"
    t.integer  "client_id"
    t.decimal  "value",            :precision => 8, :scale => 2
    t.decimal  "interest",         :precision => 8, :scale => 2
    t.decimal  "discount",         :precision => 8, :scale => 2
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "received",                                       :default => false
    t.integer  "aircraft_type_id"
  end

  create_table "flights", :force => true do |t|
    t.integer  "prefix_id"
    t.integer  "number"
    t.integer  "type_id"
    t.string   "equipment"
    t.string   "departure_aerodrome"
    t.string   "level"
    t.string   "route"
    t.string   "destination_aerodrome"
    t.decimal  "total_ett"
    t.string   "alternate_aerodrome"
    t.string   "other_information"
    t.decimal  "endurance"
    t.integer  "persons_on_board"
    t.string   "aircraft_colors_and_marks"
    t.string   "client_dac"
    t.integer  "instructor_dac"
    t.string   "registration"
    t.string   "passenger"
    t.decimal  "hourmeter"
    t.date     "flight_date"
    t.time     "flight_time"
    t.integer  "cruising_speed"
    t.string   "departure"
    t.string   "cut"
    t.string   "license"
    t.text     "comments"
    t.integer  "degree"
    t.integer  "inspections"
    t.string   "checks"
    t.string   "taxi"
    t.integer  "vertical_drop"
    t.integer  "normal_drop"
    t.integer  "drop_down"
    t.integer  "max_performance_drop"
    t.integer  "level_flight"
    t.integer  "hovering_flight"
    t.integer  "back_flight"
    t.integer  "side_flying"
    t.integer  "corrections"
    t.integer  "turns"
    t.integer  "speed_variation"
    t.integer  "direct_autorotation"
    t.integer  "autorotation_90\302\272"
    t.integer  "autorotation_180\302\272"
    t.integer  "autorotation_360\302\272"
    t.integer  "autorotation_Hovering_DES"
    t.integer  "autorotation_Hovering_FES"
    t.integer  "normal_approach"
    t.integer  "big_angle_approach"
    t.integer  "restrict_approach"
    t.integer  "normal_landing"
    t.integer  "landing_in_4_noses"
    t.integer  "run_landing"
    t.integer  "landing_incline_land"
    t.integer  "direct_landing"
    t.integer  "constant_square_nose"
    t.integer  "variable_square_nose"
    t.integer  "normal_traffic"
    t.integer  "hovered_1000ft"
    t.integer  "landing_on_helipad"
    t.integer  "quick_stop"
    t.integer  "parking_cutting"
    t.integer  "oper_in_mountain"
    t.integer  "oper_with_crosswind"
    t.integer  "meteorology"
    t.integer  "planning"
    t.integer  "plan_notification"
    t.integer  "fonia"
    t.integer  "traffic_rules"
    t.integer  "flight_route"
    t.integer  "visual_navigation"
    t.integer  "overnight_procedure"
    t.integer  "handling_publications"
    t.integer  "initiative"
    t.integer  "instructor_id"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "duration"
    t.integer  "aircraft_id"
    t.integer  "history"
    t.integer  "phase"
    t.integer  "course"
    t.string   "filled_by"
    t.integer  "engine_drive"
    t.integer  "standard_phraseology"
    t.integer  "outgoing_traffic"
    t.integer  "ascent_to_instruction_area"
    t.integer  "control_and_flaps"
    t.integer  "engine_usage"
    t.integer  "compensator_usage"
    t.integer  "small_inclination_curves"
    t.integer  "medium_inclination_curves"
    t.integer  "stall_without_engine"
    t.integer  "stall_without_engine_with_flap"
    t.integer  "stall_with_engine"
    t.integer  "simulated_breakdown"
    t.integer  "low_altitude_simulated_breakdown"
    t.integer  "s_on_the_road"
    t.integer  "arround_8_landmarks"
    t.integer  "gliding_flight"
    t.integer  "coordinating_first_type"
    t.integer  "coordinating_second_type"
    t.integer  "reduced_flight"
    t.integer  "corridor_entry"
    t.integer  "traffic_circuit"
    t.integer  "track_framework"
    t.integer  "final"
    t.integer  "final_rush"
    t.integer  "land_rush"
    t.integer  "landing_without_flap"
    t.integer  "short_landing"
    t.integer  "vertical_approach_180"
    t.integer  "vertical_approach_360"
    t.integer  "procedures_after_landing"
    t.integer  "engine_cut"
    t.integer  "abandonment_check"
    t.integer  "speed_and_altiotude_variation"
    t.integer  "landings"
  end

  create_table "instructors", :force => true do |t|
    t.string   "name"
    t.integer  "level"
    t.string   "rg"
    t.string   "cpf"
    t.string   "instructor_dac"
    t.date     "birthday"
    t.string   "address"
    t.string   "phone"
    t.string   "cel"
    t.string   "email"
    t.decimal  "hour_price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "aircraft_type_id"
  end

  create_table "sales", :force => true do |t|
    t.integer  "client_id"
    t.date     "date"
    t.integer  "aircraft_type_id"
    t.decimal  "value",            :precision => 8, :scale => 2
    t.decimal  "hours",            :precision => 2, :scale => 1
    t.string   "description"
    t.decimal  "discount",         :precision => 8, :scale => 2
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "suppliers", :force => true do |t|
    t.string   "name"
    t.boolean  "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.integer  "level"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["name"], :name => "index_users_on_name", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
