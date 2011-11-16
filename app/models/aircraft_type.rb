class AircraftType < ActiveRecord::Base
  
  has_many :aircrafts
  has_many :instructors
  
  scope :by_name, :order => :name
  
  HELICOPTERO = 1
  AUTOGYRO    = 2
  ULTRALEVE   = 3
end
