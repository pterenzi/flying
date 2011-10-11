class Client < ActiveRecord::Base
  has_many :fligths;
  
  def sales
    Account.where(:client_id => self.id)
  end
end
