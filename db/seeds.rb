# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)
Client.delete_all
Client.create(:name=>'Marcio')
Client.create(:name=>'Bonifácio')

AircraftType.delete_all
t1 = AircraftType.create(:name =>"Helicóptero")
t2 = AircraftType.create(:name =>"Autogyro")
t3 = AircraftType.create(:name =>"Ultra-leve")

Aircraft.delete_all
a1 = Aircraft.create(:prefix=>'AG-004', :aircraft_type =>t2)
a2 = Aircraft.create(:prefix=>'HE-005', :aircraft_type =>t1)
a3 = Aircraft.create(:prefix=>'UL-006', :aircraft_type =>t3)


Package.delete_all
Package.create(:name => 'heli10', :hour_price=>120,  :aircraft_type => t1, :active => true)
Package.create(:name => 'gyro15', :hour_price=>230,  :aircraft_type => t2, :active => true)
Package.create(:name => 'ultra20', :hour_price=>89,  :aircraft_type => t3, :active => true)

Instructor.delete_all
Instructor.create(:name => 'Joaquim', :instructor_dac => '234532', :hour_price=>90)
Instructor.create(:name => 'Manuel', :instructor_dac => 'fsdsf3', :hour_price=>100)

Supplier.delete_all
Supplier.create(:name => 'luz')
Supplier.create(:name => 'salário')
Supplier.create(:name => 'contador')

Sale.delete_all
# Payment.delete_all
Account.delete_all
Balance.delete_all
Entry.delete_all


puts 'SETTING UP DEFAULT USER LOGIN'
User.delete_all
user = User.create! :name => 'miguel', :email => 'user@example.com', :password => '123456', :password_confirmation => '123456', :level=>1
puts 'New user created: ' << user.name