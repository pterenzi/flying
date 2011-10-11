class Package < ActiveRecord::Base
  validates_presence_of :aircraft_type, :on => [:create, :update], :message => "can't be blank"
  validates_numericality_of :price, :quantity, :message => "is not a number"
  validates_presence_of :price, :quantity, :message => "can't be blank"
  
  belongs_to :aircraft_type
end
