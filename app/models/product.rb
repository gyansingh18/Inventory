class Product < ApplicationRecord
  belongs_to :cateogory

  has_many :purchase_order_items
  has_many :sales_order_items
end
