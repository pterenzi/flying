class Account < ActiveRecord::Base
  
  belongs_to :client
  belongs_to :package
    
  validates_numericality_of :value, :on => [:create, :update], :message => "is not a number"
  validates_presence_of :value, :on => [:create, :update], :message => "can't be blank"
  
  scope :payments, where(:credit => false)
  scope :sales, where(:credit => true)
  
  
  def to_label
    "#{client_id} (#{company_id})"
  end
end
