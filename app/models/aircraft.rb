class Aircraft < ActiveRecord::Base
  belongs_to :aircraft_type
  has_many   :flights
end
