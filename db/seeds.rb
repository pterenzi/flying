# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

AircraftType.delete_all
t1 = AircraftType.create(:name =>"Helicóptero", :hour_price=>120)
t2 = AircraftType.create(:name =>"Autogyro", :hour_price=>230)
t3 = AircraftType.create(:name =>"Ultra-leve", :hour_price=>89)



Sale.delete_all
# Payment.delete_all
Account.delete_all
Balance.delete_all
Entry.delete_all


# puts 'SETTING UP DEFAULT USER LOGIN'
# User.delete_all
# user = User.create! :name => 'miguel', :email => 'user@example.com', :password => '123456', :password_confirmation => '123456', :level=>1
# puts 'New user created: ' << user.name