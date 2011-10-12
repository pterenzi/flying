class Flight < ActiveRecord::Base
  belongs_to :client
  belongs_to :instructor
  belongs_to :fligth
  
  after_save :create_balance
  
    def create_balance
      Balance.create(:client_id  => self.client_id,
                     :flight_id  => self.id,
                     :date       => self.due_date,
                     :hours      => self.duration,
                     :aircraft_type_id => self.package.aircraft_type.id)
  end

end
