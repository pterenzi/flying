class AircraftType < ActiveRecord::Base
  
  has_many :aircrafts
  
  scope :by_name, :order => :name
end
