class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  #, :trackable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :rememberable

  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation#, :remember_me
  
  def master?
    self.level == 1
  end
  
  def admin?
    self.level < 3
  end
end
