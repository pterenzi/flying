class Flight < ActiveRecord::Base
  belongs_to :client
  belongs_to :instructor
  belongs_to :aircraft
  
  after_save :create_balance
  
  scope :by_client, lambda{|id| where("client_id = ? ", id)}                
  
  scope :by_date, lambda {|start_date,end_date| 
                    where("flight_date between  ? and  ? ", start_date, end_date)
                  }
  scope :by_instructor, lambda{|id| where("instructor_id = ? ", id)}                
  
  def create_balance
    Balance.create(:client_id  => self.client_id,
                   :flight_id  => self.id,
                   :date       => self.flight_date,
                   :hours      => self.duration,
                   :aircraft_type_id => self.aircraft.aircraft_type_id)
  end

end
