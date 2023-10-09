class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
  belongs_to :order 
  has_many :cart_items
  
  def with_tax_price
    (price * 1.1).floor
  end
         
  def active_for_authentication?
    super && (is_deleted == false)
  end
end
