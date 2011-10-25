class Aircraft < ActiveRecord::Base
  belongs_to :aircraft_type
  has_many   :flights
  
  scope :starting_with, lambda { |i| where('prefix like (?)', i+'%')}
  
end
