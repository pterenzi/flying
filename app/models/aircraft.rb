class Aircraft < ActiveRecord::Base
  belongs_to :aircraft_type
  has_many   :flights
  
  scope :starting_with, lambda { |i| where('prefix like (?)', i+'%')}

  def is_helicoptero?
    self.aircraft_type_id == AircratfType::HELICOPTERO
  end

  def is_autogyro?
    self.aircraft_type_id == AircratfType::AUTOGYRO
  end
  
  def is_ultraleve?
    self.aircraft_type_id = AircratfType::ULTRALEVE
  end
end
