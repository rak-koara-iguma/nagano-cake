class Order < ApplicationRecord
  
  has_many :customers
  has_many :order_details
  #enum payment_method: { credit_card: 0, transfer: 1 }
  enum method_of_payment: { credit_card: 0, transfer: 1 }
end
