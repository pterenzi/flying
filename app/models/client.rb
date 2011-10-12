class Client < ActiveRecord::Base

  # has_many :fligths
  has_many :balances
  
  def sales
    Account.where(:client_id => self.id)
  end
  
  def flights
    Flight.where(:client_id => self.id)
  end
  
end
