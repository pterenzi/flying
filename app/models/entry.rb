class Entry < ActiveRecord::Base
  
  belongs_to :client
  
  validates_presence_of :value, :message => "can't be blank"
  validates_numericality_of :value, :message => "is not a number"
  validates_presence_of :description, :message => "can't be blank"
  
  scope :by_date, lambda {|start_date,end_date| where('date between ? and ? ', start_date, end_date )}
end
