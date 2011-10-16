class Package < ActiveRecord::Base
  
  validates_presence_of :aircraft_type, :on => [:create, :update], :message => "can't be blank"
  
  belongs_to :aircraft_type
  
  scope :actives, where(:active => true)
  scope :by_name, :order => :name
  
  def hourly_price
    self.price / self.quantity
  end
    
  def description
    self.aircraft_type.name + ' : ' + self.quantity.to_s + ' horas por ' + self.price.to_s
  end
end
