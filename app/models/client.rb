class Client < ActiveRecord::Base

  # has_many :fligths
  has_many :balances
  has_many :entries
  has_many :sales
  
  scope :starting_with, lambda { |i| where('name like (?)', i+'%')}
  
  # def sales
  #     Account.where(:client_id => self.id)
  #   end
  #   
  def flights
    Flight.where(:client_id => self.id)
  end
  
end
