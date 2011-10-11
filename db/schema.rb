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

ActiveRecord::Schema.define(:version => 20111011105947) do

  create_table "accounts", :force => true do |t|
    t.integer  "client_id"
    t.integer  "type"
    t.integer  "company_id"
    t.date     "due_date"
    t.string   "description"
    t.decimal  "value"
    t.string   "barcode"
    t.boolean  "status"
    t.date     "payment_date"
    t.decimal  "interest"
    t.decimal  "discount"
    t.text     "comments"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "credit",       :default => false
    t.integer  "package_id"
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "aircrafts", :force => true do |t|
    t.string   "prefix"
    t.string   "type"
    t.string   "owner"
    t.string   "manufacturer"
    t.string   "model"
    t.string   "color"
    t.time     "hourmeter"
    t.date     "maintenance_break"
    t.date     "last_maintenance"
    t.time     "flyght_hours"
    t.string   "details"
    t.string   "equipment"
    t.string   "speed"
    t.string   "operator"
    t.integer  "aircraft_type_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

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

  create_table "flights", :force => true do |t|
    t.integer  "prefix_id"
    t.integer  "number"
    t.integer  "type_id"
    t.string   "equipment"
    t.string   "departure_aerodrome"
    t.string   "level"
    t.string   "route"
    t.string   "destination_aerodrome"
    t.time     "total_ett"
    t.string   "alternate_aerodrome"
    t.string   "other_information"
    t.time     "endurance"
    t.integer  "persons_on_board"
    t.string   "aircraft_colors_and_marks"
    t.string   "client_dac"
    t.integer  "instructor_dac"
    t.string   "registration"
    t.string   "passenger"
    t.string   "hourmeter"
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
    t.integer  "autorotation_90º"
    t.integer  "autorotation_180º"
    t.integer  "autorotation_360º"
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
  end

  create_table "packages", :force => true do |t|
    t.string   "name"
    t.integer  "quantity"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "aircraft_type_id"
    t.boolean  "active",           :default => true
  end

end
