class Instructor < ActiveRecord::Base
  has_many :flights
  belongs_to :aircraft_type
  
  validates_numericality_of :hour_price, :on => [:create, :update], :message => "is not a number"
  validates_presence_of :hour_price, :on => :create, :message => "can't be blank"
  validates_presence_of :aircraft_type_id
  
  scope :starting_with, lambda { |i| where('name like (?)', i+'%')}
end
