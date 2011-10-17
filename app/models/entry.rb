class Entry < ActiveRecord::Base
  
  belongs_to :client
  
  validates_presence_of :value, :message => "can't be blank"
  validates_numericality_of :value, :message => "is not a number"
  validates_presence_of :description, :message => "can't be blank"
  
  scope :between_date, lambda {|start_date,end_date| where('entry_date between ? and ? ', start_date, end_date )}
  
  scope :by_client, lambda{|id| where("client_id = ? ", id)}
  
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
end
