class AircraftType < ActiveRecord::Base
  
  has_many :aircrafts
  has_many :instructors
  
  scope :by_name, :order => :name
end
