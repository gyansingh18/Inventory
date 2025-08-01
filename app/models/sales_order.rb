class SalesOrder < ApplicationRecord
  belongs_to :customer
  has_many :sales_order_items
  has_many :products, through: :sales_order_items
end
