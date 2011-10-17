class Sale < ActiveRecord::Base

  belongs_to :client
  belongs_to :aircraft_type
  
  validates_presence_of :client_id, :date

  scope :between_date, lambda {|start_date,end_date| 
                    where("date between  ? and  ? ", start_date, end_date)}
  scope :by_client, lambda{|id| where("client_id = ? ", id)}                
  
  after_save :create_balance
  
  attr_accessor :date_br
  
  def date_br
    if Date.valid?(self.date)
      self.date.to_s_br
    else
      Date.today.to_s_br
    end
  end
  
  def date_br=(val)
    self.date = val.to_date rescue nil
  end

  def total_value
    self.hours * self.value
  end
  
  def create_balance
    Balance.create(:client_id    => self.client_id,
                   :sale_id      => self.id,
                   :date         => self.date,
                   :hours        => self.hours,
                   :aircraft_type_id => self.package.aircraft_type.id)
  end
  
end
