class Balance < ActiveRecord::Base
  belongs_to :client
  belongs_to :sale
  belongs_to :flight
  
  attr_reader :date_br
  
  def date_br
    self.date.to_s_br.split(" ")[0] if self.date
  end
  
  def credit?
    self.sale_id.present?
  end
  
  def debit?
    !self.credit?
  end
end
