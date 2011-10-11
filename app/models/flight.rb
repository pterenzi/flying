class Flight < ActiveRecord::Base
  belongs_to :client
  belongs_to :instructor
  belongs_to :fligth
end
