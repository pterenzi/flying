class ChangeFlightsFields < ActiveRecord::Migration
  def up
        add_column :flights, :history, :integer
        add_column :flights, :phase, :integer
        add_column :flights, :course, :integer
        add_column :flights, :filled_by, :string
        add_column :flights, :engine_drive, :integer
        add_column :flights, :standard_phraseology, :integer
        add_column :flights, :outgoing_traffic, :integer
        add_column :flights, :ascent_to_instruction_area, :integer
        add_column :flights, :control_and_flaps, :integer
        add_column :flights, :engine_usage, :integer
        add_column :flights, :compensator_usage, :integer
        add_column :flights, :small_inclination_curves, :integer
        add_column :flights, :medium_inclination_curves, :integer
        add_column :flights, :stall_without_engine, :integer
        add_column :flights, :stall_without_engine_with_flap, :integer
        add_column :flights, :stall_with_engine, :integer
        add_column :flights, :simulated_breakdown, :integer
        add_column :flights, :low_altitude_simulated_breakdown, :integer
        add_column :flights, :s_on_the_road, :integer
        add_column :flights, :arround_8_landmarks, :integer
        add_column :flights, :gliding_flight, :integer
        add_column :flights, :coordinating_first_type, :integer
        add_column :flights, :coordinating_second_type, :integer
        add_column :flights, :reduced_flight, :integer
        add_column :flights, :corridor_entry, :integer
        add_column :flights, :traffic_circuit, :integer
        add_column :flights, :track_framework, :integer
        add_column :flights, :final, :integer
        add_column :flights, :final_rush, :integer
        add_column :flights, :land_rush, :integer
        add_column :flights, :landing_without_flap, :integer
        add_column :flights, :short_landing, :integer
        add_column :flights, :vertical_approach_180, :integer
        add_column :flights, :vertical_approach_360, :integer
        add_column :flights, :procedures_after_landing, :integer
        add_column :flights, :engine_cut, :integer
        add_column :flights, :abandonment_check, :integer
        add_column :flights, :speed_and_altiotude_variation, :integer
        change_column :flights, :hourmeter, :decimal, :precision=>2, :scale=>1
  end

  def down
    remove_column :flights, :history
    remove_column :flights, :phase
    remove_column :flights, :course
    remove_column :flights, :filled_by
    remove_column :flights, :engine_drive
    remove_column :flights, :standard_phraseology
    remove_column :flights, :outgoing_traffic
    remove_column :flights, :ascent_to_instruction_area
    remove_column :flights, :control_and_flaps
    remove_column :flights, :engine_usage
    remove_column :flights, :compensator_usage
    remove_column :flights, :small_inclination_curves
    remove_column :flights, :medium_inclination_curves
    remove_column :flights, :stall_without_engine
    remove_column :flights, :stall_without_engine_with_flap
    remove_column :flights, :stall_with_engine
    remove_column :flights, :simulated_breakdown
    remove_column :flights, :low_altitude_simulated_breakdown
    remove_column :flights, :s_on_the_road
    remove_column :flights, :arround_8_landmarks
    remove_column :flights, :gliding_flight
    remove_column :flights, :coordinating_first_type
    remove_column :flights, :coordinating_second_type
    remove_column :flights, :reduced_flight
    remove_column :flights, :corridor_entry
    remove_column :flights, :traffic_circuit
    remove_column :flights, :track_framework
    remove_column :flights, :final
    remove_column :flights, :final_rush
    remove_column :flights, :land_rush
    remove_column :flights, :landing_without_flap
    remove_column :flights, :short_landing
    remove_column :flights, :vertical_approach_180
    remove_column :flights, :vertical_approach_360
    remove_column :flights, :procedures_after_landing
    remove_column :flights, :engine_cut
    remove_column :flights, :abandonment_check
    remove_column :flights, :speed_and_altiotude_variation
  end
end
