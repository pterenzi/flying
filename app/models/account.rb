class Account < ActiveRecord::Base
  
  validates_numericality_of :value, :on => [:create, :update], :message => "is not a number"
  validates_presence_of :value, :on => [:create, :update], :message => "can't be blank"
  
  def to_label
    "#{client_id} (#{company_id})"
  end
end
