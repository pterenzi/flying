class Instructor < ActiveRecord::Base
  has_many :flights
  
  validates_numericality_of :hour_price, :on => [:create, :update], :message => "is not a number"
  validates_presence_of :hour_price, :on => :create, :message => "can't be blank"
  
  scope :starting_with, lambda { |i| where('name like (?)', i+'%')}
end
