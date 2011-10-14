class Sale < ActiveRecord::Base
  belongs_to :client
  belongs_to :package
  
  validates_presence_of :client_id, :date
  
  after_save :create_balance
  
  scope :by_date, lambda {|start_date,end_date| where("date between  ? and  ? ", start_date, end_date)
                  }
  scope :by_client, lambda{|id| where("client_id = ? ", id)}                

  
  def create_balance
    Balance.create(:client_id    => self.client_id,
                   :sale_id      => self.id,
                   :date         => self.date,
                   :hours        => self.hours,
                   :aircraft_type_id => self.package.aircraft_type.id)
  end
  
end
