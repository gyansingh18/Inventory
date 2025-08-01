class PurchaseOrder < ApplicationRecord
  belongs_to :supplier
  has_many :purchase_order_items
  has_many :products, through: :purchase_order_items
end
