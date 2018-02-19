class CartLineItem < ApplicationRecord
	belongs_to :user
	belongs_to :product
	validates_presence_of :product_id, :user_id, :quantity

	def save_or_update
		line_item = CartLineItem.find_by(user_id: self.user_id, product_id: self.product_id)
		if line_item.nil?
			self.save 
		else 
			line_item.update_attributes(quantity: line_item.quantity + self.quantity)
		end
	end 
	# def remove_from_wishlist
	# 	remove_item = Wishlist.find_by(user_id: self.user_id, product_id: self.product_id)
	# 	remove_item.destroy
	# end
end
