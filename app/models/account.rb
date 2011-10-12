class Account < ActiveRecord::Base
  
  belongs_to :client
  belongs_to :package
  belongs_to :supplier
    
  validates_numericality_of :value, :on => [:create, :update], :message => "is not a number"
  validates_presence_of :value, :on => [:create, :update], :message => "can't be blank"
  
  after_save :create_balance
  
  scope :payments, where(:credit => false)
  scope :sales, where(:credit => true)
  
  
  def to_label
    "#{client_id} (#{company_id})"
  end
  
  def create_balance
    if self.credit?
      Balance.create(:client_id  => self.client_id,
                     :account_id => self.id,
                     :date       => self.due_date,
                     :hours      => self.hours,
                     :aircraft_type_id => self.package.aircraft_type.id)
    end  
  end
  
end
