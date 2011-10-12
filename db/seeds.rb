# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

Client.create(:name=>'Marcio')

Package.delete_all
Package.create(:name => 'heli10', :quantity => 10, :price => 980.00, :aircraft_type_id => 1, :active => true)
Package.create(:name => 'gyro15', :quantity => 15, :price => 670.00, :aircraft_type_id => 2, :active => true)
Package.create(:name => 'ultra20', :quantity => 20, :price => 1280.00, :aircraft_type_id => 3, :active => true)

Instructor.delete_all
Instructor.create(:name => 'Joaquim', :instructor_dac => '234532', :hour_price=>90)
Instructor.create(:name => 'Manuel', :instructor_dac => 'fsdsf3', :hour_price=>100)

