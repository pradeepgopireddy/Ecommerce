class OrderLineItem < ApplicationRecord
	belongs_to :product
	belongs_to :order

	validates_presence_of :product_id, :price, :quantity, :order_id
end
