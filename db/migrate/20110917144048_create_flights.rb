class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :prefix_id
      t.integer :number
      t.integer :type_id
      t.string :equipment
      t.string :departure_aerodrome
      t.string :level
      t.string :route
      t.string :destination_aerodrome
      t.time :total_ett
      t.string :alternate_aerodrome
      t.string :other_information
      t.time :endurance
      t.integer :persons_on_board
      t.string :aircraft_colors_and_marks
      # t.integer :client_id
      t.string :client_dac
      # t.integer :instructor_id
      t.integer :instructor_dac
      t.string :registration
      t.string :passenger
      t.string :hourmeter
      t.date :flight_date
      t.time :flight_time
      t.integer :cruising_speed
      t.string :departure
      t.string :cut
      t.string :license
      t.text :comments
      t.integer :degree
      t.integer :inspections
      t.integer :departure
      t.string :checks
      t.string :taxi
      t.integer :vertical_drop
      t.integer :normal_drop
      t.integer :drop_down
      t.integer :max_performance_drop
      t.integer :level_flight
      t.integer :hovering_flight
      t.integer :back_flight
      t.integer :side_flying
      t.integer :corrections
      t.integer :turns
      t.integer :speed_variation
      t.integer :direct_autorotation
      t.integer :autorotation_90º
      t.integer :autorotation_180º
      t.integer :autorotation_360º
      t.integer :autorotation_Hovering_DES
      t.integer :autorotation_Hovering_FES
      t.integer :normal_approach
      t.integer :big_angle_approach
      t.integer :restrict_approach
      t.integer :normal_landing
      t.integer :landing_in_4_noses
      t.integer :run_landing
      t.integer :landing_incline_land
      t.integer :direct_landing
      t.integer :constant_square_nose
      t.integer :variable_square_nose
      t.integer :normal_traffic
      t.integer :hovered_1000ft
      t.integer :landing_on_helipad
      t.integer :quick_stop
      t.integer :parking_cutting
      t.integer :oper_in_mountain
      t.integer :oper_with_crosswind
      t.integer :meteorology
      t.integer :planning
      t.integer :plan_notification
      t.integer :fonia
      t.integer :traffic_rules
      t.integer :flight_route
      t.integer :visual_navigation
      t.integer :overnight_procedure
      t.integer :handling_publications
      t.integer :initiative
      t.references :instructor
      t.references :client
      
      t.timestamps
    end
  end
end
