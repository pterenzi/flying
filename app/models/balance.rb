class Balance < ActiveRecord::Base
  belongs_to :client
  belongs_to :sale
  belongs_to :flight
  
  def credit?
    self.sale_id.present?
  end
  
  def debit?
    !self.credit?
  end
end
