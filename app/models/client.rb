class Client < ActiveRecord::Base

  # has_many :fligths
  has_many :balances
  has_many :entries
  has_many :sales
  
  scope :starting_with, lambda { |i| where('name like (?)', i+'%')}
  
  def flights
    Flight.where(:client_id => self.id)
  end
  
  def credit
    hours = 0
    self.sales.each do |sale|
      hours += sale.hours
    end
    self.flights.each do |flight|
      hours -= flight.duration if flight.duration.present?
    end
    hours
  end
end
