class Flight < ActiveRecord::Base
  belongs_to :client
  belongs_to :instructor
  belongs_to :aircraft
  belongs_to :aircraft_type
  
  after_save :create_balance
  

  scope :by_aircraft, lambda{|id| where("aircraft_id = ? ", id)}                
  scope :by_client, lambda{|id| where("client_id = ? ", id)}                
  scope :by_client, lambda{|id| where("aircraft_type_id = ? ", id)}  
  scope :between_date, lambda {|start_date,end_date| 
                    where("flight_date between  ? and  ? ", start_date, end_date)
                  }
  scope :by_instructor, lambda{|id| where("instructor_id = ? ", id)}                
  
  attr_accessor :flight_date_br
  
  def flight_date_br
    if Date.valid?(self.flight_date)
      self.flight_date.to_s_br
    else
      Date.today.to_s_br
    end
  end
  
  def flight_date_br=(val)
    self.flight_date = val.to_date rescue nil
  end

  
  def create_balance
    Balance.create(:client_id  => self.client_id,
                   :flight_id  => self.id,
                   :date       => self.flight_date,
                   :hours      => self.duration,
                   :aircraft_type_id => self.aircraft.aircraft_type_id)
  end

end
