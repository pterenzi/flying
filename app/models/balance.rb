class Balance < ActiveRecord::Base
  belongs_to :client
  belongs_to :account
  belongs_to :flight
  
  def credit?
    self.account_id.present?
  end
  
  def debit?
    !self.credit?
  end
end
