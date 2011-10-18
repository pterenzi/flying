class Entry < ActiveRecord::Base
  
  belongs_to :client
  
  validates_presence_of :client, :message => "can't be blank"
  validates_presence_of :value, :message => "can't be blank"
  validates_numericality_of :value, :message => "is not a number"
  validates_presence_of :description, :message => "can't be blank"
  
  scope :between_date, lambda {|start_date,end_date| where('entry_date between ? and ? ', start_date, end_date )}
  
  scope :by_client, lambda{|id| where("client_id = ? ", id)}
  scope :confirmed, where(:received=>true)
  scope :not_confirmed, where(:received=>false)
  attr_accessor :due_date_br, :entry_date_br
  
  def due_date_br
    if Date.valid?(self.due_date)
      self.due_date.to_s_br
    else
      Date.today.to_s_br
    end
  end
  def due_date_br=(val)
    self.due_date = val.to_date rescue nil
  end

  def entry_date_br
    if Date.valid?(self.entry_date)
      self.entry_date.to_s_br
    else
      ''
    end
  end
  def entry_date_br=(new_date)
    self.entry_date = new_date.to_date #rescue nil
  end
  
  def total
    result = self.value
    result += self.interest if self.interest
    result -= self.discount if self.discount
    result
  end
end
