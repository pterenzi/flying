class Account < ActiveRecord::Base
  
  belongs_to :supplier
    
  validates_numericality_of :value, :on => [:create, :update], :message => "is not a number"
  validates_presence_of :value, :on => [:create, :update], :message => "can't be blank"
  
  scope :between_due_dates, lambda {|start_date,end_date| 
                    where("due_date between  ? and  ? ", start_date, end_date)
                  }
  scope :between_payment_dates, lambda {|start_date,end_date| 
                    where("payment_date between  ? and  ? ", start_date, end_date)
                  }
  scope :by_supplier, lambda{|id| where("supplier_id = ? ", id)}  
  scope :confirmed, lambda {|payed| where('payed=?' , payed)}
  scope :not_payed, where(:payed=>false)

  scope :payments, where("credit IS NULL or credit = ?",false)
  scope :sales, where(:credit => true)
  
  attr_accessor :payment_date_br, :due_date_br

  def payment_date_br
    if Date.valid?(self.payment_date)
      self.payment_date.to_s_br
    else
      ''
    end
  end
  def payment_date_br=(val)
    self.payment_date = val.to_date rescue nil
  end
  
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
  
  def to_label
    "#{client_id} (#{company_id})"
  end
  

  def due_date
    self.payment_date
  end
  
  def copy_date_when_credit
    if self.credit?
      self.update_attribute("payment_date", self.due_date)
    end
  end
  
  def total
    result = self.value
    result += self.interest if self.interest
    result -= self.discount if self.discount
    result
  end

end
